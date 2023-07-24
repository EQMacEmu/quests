-- PoTimeA controller
local POTIMEA_CONTROLLER_TYPE = 219053;
local POTIMEB_CONTROLLER_TYPE = 223077;
local TIMEB_ZONEID = 223;
local TRIAL_TELEPORTS = {
	[1] = { -35, 1636, 495, 128 },		-- earth
	[2] = { -36, 1352, 495, 128 },		-- air
	[3] = { -27, 1103, 495, 128 },		-- undead
	[4] = { -51,  857, 495, 128 },		-- water
	[5] = { -55,  569, 495, 128 },		-- fire
};
local PHASE_LOCS = {
	[3] = { 800, 1100, 494, 128 },
	[4] = { -401, 0, 348.75, 128 },
	[5] = { -419, 0, 3.75, 128 },
	[6] = { -419, 0, 3.75, 128 },
};
local RUN_SPEED_BUFFS = { 220,1922,3185, 424,1554,2002, 874,1340, 169, 278,1776,1921,2517,2524,1330,1750,2007, 717,2605 };

local activeRaidID, activeInstanceID, numRaiders, activePhase, quarmState = 0, 0, 0, 0, 0;
local trialRaiders = {};
local block, playerZoned;

function Unpacket(s, numberize, returnTable)
	local t = {};
	for w in s:gmatch("([^;]+)") do
		if ( numberize ) then
			w = tonumber(w);
		end
		table.insert(t, w);
	end
	if (returnTable) then
		return t;
	else
		return unpack(t);
	end
end

function event_signal(e)

	if ( e.signal == 1 ) then		-- new instance started
		
		local charID, dialNum, raidID, instanceID = Unpacket(e.data, true);
		
		if ( raidID and instanceID ) then
			eq.debug("Plane of Time instance started.  Raid ID: "..raidID..";  instanceID: "..instanceID);
			activeRaidID = raidID;
			activeInstanceID = instanceID;
			numRaiders, activePhase, quarmState = 0, 1, 0;
			for i = 1, 9 do
				trialRaiders[i] = 0;
			end
			eq.signal(POTIMEB_CONTROLLER_TYPE, 2);	-- send confirm
			block = false;
			eq.stop_timer("unblock");
			--eq.zone_emote(0, "The portal flashes briefly, then glows steadily.");
			
			-- send instance starter inside
			e.signal = 3;
			event_signal(e);
			return;
		end
	
	elseif ( e.signal == 2 ) then			-- instance expired
		
		activePhase = -1;
		eq.set_timer("cooldown", 120000);
		eq.signal(POTIMEB_CONTROLLER_TYPE, 2);	-- send confirm
		eq.debug("Plane of Time instance expired.");
	
	elseif ( e.signal == 3 ) then			-- player clicked dial; sent from dial
	
		if ( not e.data or block ) then
			return;
		end
		
		local charID, dialNum, raidID, instanceID = Unpacket(e.data, true);		
		local client = eq.get_entity_list():GetClientByCharID(charID);
		local charName = client:GetName();
		eq.debug("client clicked dial.  charID: "..charID.." ("..charName..");  dialNum: "..dialNum..";  raidID: "..raidID..";  instanceID: "..instanceID);
		eq.debug("active raid ID: "..activeRaidID..";  active instance ID: "..activeInstanceID);

		if ( activePhase == -1 ) then
			client:Message(0, "The portal glows weakly at first, then somewhat brighter.  It appears to be recharging.");
			return;
		end

		if ( activeRaidID == 0 and activeInstanceID == 0 and activePhase == 0 ) then
			-- TimeB is inactive and not cooling down, relay signal
			eq.signal(POTIMEB_CONTROLLER_TYPE, 1, 0, e.data..";"..charName);
			block = true;	-- block signals until the instance is started
			eq.set_timer("unblock", 60000); -- in case signals are lost somehow
			
		elseif ( activeRaidID ~= raidID ) then
			-- player is in the wrong raid
			-- note: this text is not what Sony used.  I don't have a log of what they used so made this up
			client:Message(0, "The portal glows momentarily before fading.  You see a brief vision of unfamiliar warriors in a great battle against the gods.");
		
		
		elseif ( instanceID > 0 and activeInstanceID ~= instanceID ) then
			-- player is saved to an instance that is not the same as the active instance
			
			local qglobals = eq.get_qglobals(POTIMEB_CONTROLLER_TYPE, 223);
			local instanceTimers = qglobals["time_timers_"..instanceID];
			local instanceExpired = true;
			if ( instanceTimers ) then
				local timers = Unpacket(instanceTimers, true, true);
				local now = os.time();
				for _, t in pairs(timers) do
					if ( now < (t*100) ) then
						instanceExpired = false;
						break;
					end
				end
			else
				eq.debug(client:GetName().."'s saved instance ("..instanceID..") does not exist.  Allowing entry.");
			end
			
			if ( instanceExpired and instanceTimers ) then
				eq.debug(client:GetName().."'s saved instance ("..instanceID..") has expired timers.  Allowing player to switch instances.");
			end

			if ( not instanceExpired ) then
				-- player is saved to an instance with timers not expired.  deny entry
				-- note: this text is not what Sony used.  I don't have a log of what they used so made this up
				client:Message(0, "The portal glows momentarily before fading.  You sense that you are not attuned with whoever first activated it.");
			else
				-- send player into active instance even though IDs don't match
				e.data = charID..";"..dialNum..";"..raidID..";"..activeInstanceID;
				event_signal(e);
				return;
			end

		elseif ( (instanceID == activeInstanceID or instanceID == 0) and raidID == activeRaidID ) then
			
			local p2reject;
			if ( activePhase == 2 ) then
				if ( dialNum < 3 ) then
					if ( trialRaiders[6] >= 36 ) then
						p2reject = true;
					end
				elseif ( dialNum > 3 ) then
					if ( trialRaiders[8] >= 36 ) then
						p2reject = true;
					end
				else
					if ( trialRaiders[7] >= 18 ) then
						p2reject = true;
					end
				end				
			end
			
			if ( numRaiders >= 60 or (activePhase == 1 and trialRaiders[dialNum] >= 18) or p2reject ) then
				client:Message(0, "The energy has been drained from this portal.  You must wait before you can use it.");
			else
				client:Message(0, "The portal glows and the mists of time swirl around you.");
				
				-- keep track of how many people get in
				if ( activePhase == 1 ) then
					trialRaiders[dialNum] = trialRaiders[dialNum] + 1;
				elseif ( activePhase == 2 ) then
					if ( dialNum == 1 or dialNum == 2 ) then
						trialRaiders[6] = trialRaiders[6] + 1;
					elseif ( dialNum == 3 ) then
						trialRaiders[7] = trialRaiders[7] + 1;
					elseif ( dialNum == 4 or dialNum == 5 ) then
						trialRaiders[8] = trialRaiders[8] + 1;
					end
				end
				
				-- remove run speed buffs if quarm engaged
				if ( activePhase == 6 and quarmState > 1 and quarmState < 5 ) then
					for _, id in ipairs(RUN_SPEED_BUFFS) do
						client:BuffFadeBySpellID(id);
					end
				end

				eq.signal(POTIMEB_CONTROLLER_TYPE, 3, 0, client:CharacterID()..";"..dialNum);
				
				local loc = TRIAL_TELEPORTS[dialNum];
				if ( PHASE_LOCS[activePhase] ) then
					loc = PHASE_LOCS[activePhase];
				end
				playerZoned = true;
				client:MovePC(TIMEB_ZONEID, loc[1], loc[2], loc[3], loc[4]);
			end
		end
		
	elseif ( e.signal == 4 ) then		-- zone state update / phase change
	
		if ( not e.data ) then
			return;
		end

		activeRaidID, activeInstanceID, activePhase = Unpacket(e.data, true);
		
		eq.debug("PoTimeB (instance ID "..activeInstanceID.."; raid ID "..activeRaidID..") active phase is now "..activePhase);
		eq.signal(POTIMEB_CONTROLLER_TYPE, 2);	-- send confirm
		block = false;
	
	elseif ( e.signal == 5 ) then		-- periodic player counts

		local oldCount = numRaiders;
		local counts = Unpacket(e.data, true, true);
		
		if ( not playerZoned ) then
			-- use PoTimeB numbers if nobody has zoned since last update.  doing this because if people zone over right before
			-- TimeB reports counts, then they can be off due to zoning delay
			trialRaiders = counts;
			numRaiders = counts[9];
		else
			-- somebody zoned over recently, so use higher of the two values
			for i = 1, 9 do
				if ( counts[i] > trialRaiders[i] ) then
					trialRaiders[i] = counts[i];
				end
			end
			numRaiders = trialRaiders[9];
		end
		playerZoned = false;		
		
		if ( oldCount ~= numRaiders ) then
			if ( activePhase == 1 ) then
				eq.debug("Active Raiders: "..numRaiders.."  --  Earth: "..trialRaiders[1]..";  Air: "..trialRaiders[2]..";  Undead: "..trialRaiders[3]..";  Water: "..trialRaiders[4]..";  Fire: "..trialRaiders[5]);
			elseif ( activePhase == 2 ) then
				eq.debug("Active Raiders: "..numRaiders.."  --  Earth+Air: "..trialRaiders[6]..";  Undead: "..trialRaiders[7]..";  Water+Fire: "..trialRaiders[8]);
			else
				eq.debug("Active Raiders: "..numRaiders);
			end
		end
		
	elseif ( e.signal == 6 ) then			-- Quarm state

		if ( not e.data ) then
			return;
		end

		quarmState = tonumber(e.data) or 0;

		if ( quarmState == 5 ) then
			eq.debug("Quarm slain; instance ends in 1 hour");
		else
			eq.debug("Quarm state is now "..quarmState);
		end
		
	elseif ( e.signal == 7 ) then			-- PoTimeB zone reset
		ResetZone();
		eq.debug("PoTimeB script reset");
	end
end

function event_timer(e)
	if ( e.timer == "unblock" ) then
		block = false;
		--eq.debug("unblocked", 3);
	elseif ( e.timer == "cooldown" ) then
		ResetZone();
	end
	eq.stop_timer(e.timer);
end

function ResetZone()
	activeRaidID, activeInstanceID, numRaiders, activePhase = 0, 0, 0, 0;
	for i = 1, 8 do
		trialRaiders[i] = 0;
	end
end

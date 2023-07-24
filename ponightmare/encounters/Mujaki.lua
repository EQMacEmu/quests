-- event starts 5 minutes after the first group ports in
-- Mujaki and riders respawn after 25 minutes of cumulative unaggro time after they become active/targetable
-- note: this script uses the terms 'instance' 'trial' and 'room' interchangeably
--[[
		video recording of Live event was:
		0:10 port-in
		5:10 singles
		7:11 singles
		9:12 singles
		11:13 doubles
		13:14 doubles
		15:15 doubles
		17:17 doubles
		19:18 singles
		21:18 boss  (16:08 after wave 1)
]]

local GOVERNOR_TYPE = 204455; -- Grave_Checker
local MUJAKI_TYPE = 204039; -- Mujaki_the_Devourer
local ETUMER_TYPE = 204036; -- Etumer
local SERVANT_TYPE = 204470; -- a_servant_of_Mujaki (level 58)
local RIDER_TYPE = 204471; -- a_servant_of_Mujaki (level 60)
local HELOT_TYPE = 204466; -- #a_helot_of_Mujaki

local MUJAKI_SPAWNIDS = { 345997, 345998, 345999 }; -- note: this order is important; starts right to left
local BOUNDARIES = {
	{ t = -2000, l = -950, r = -2000, b = -3100 },
	{ t = -3000, l = 100, r = -950, b = -4100 },
	{ t = -2000, l = 1200, r = 100, b = -3100 },
};
local PORT_COORDS = {
	{ x = -1936, y = -2109, z = 170 },
	{ x = -882, y = -3112, z = 170 },
	{ x = 164, y = -2113, z = 170 },
};
local SPAWN_LOCS = {
	{
		{ x = -1090, y = -2660, z = 149 },
		{ x = -1462, y = -2985, z = 149 },
		{ x = -1862, y = -2660, z = 149 },
	},
	{
		{ x = -37, y = -3660, z = 149 },
		{ x = -409, y = -3985, z = 149 },
		{ x = -809, y = -3660, z = 149 },
	},
	{
		{ x = 1006, y = -2660, z = 149 },
		{ x = 634, y = -2985, z = 149 },
		{ x = 234, y = -2660, z = 149 },
	},
};

--[[
		states:
			0 = trial is reset/available
			1 = at least one group ported in but mobs not spawning yet
			2 = waves spawning
			3 = waves no longer spawning and boss is active
			4 = trial is over win or fail; script will clean-up and reset trial after all players leave
]]
local instance = {
	{ rid = 0, ports = 0, wave = 0, state = 0, ids = {} },
	{ rid = 0, ports = 0, wave = 0, state = 0, ids = {} },
	{ rid = 0, ports = 0, wave = 0, state = 0, ids = {} }
};

function ClientInTrial(trialNum)
	local clientList = eq.get_entity_list():GetClientList();

	if ( clientList ) then
		for client in clientList.entries do
			if ( client.valid and client:GetY() < BOUNDARIES[trialNum].t
				and client:GetY() > BOUNDARIES[trialNum].b
				and client:GetX() < BOUNDARIES[trialNum].l
				and client:GetX() > BOUNDARIES[trialNum].r
			) then
				if ( not client:GetGM() ) then
					return true;
				end
			end
		end
	end
	return false;
end

function CheckRemoveFromTrial(trialNum, limit, zone, x, y, z, h)
	local clientList = eq.get_entity_list():GetClientList();
	local n = 0;

	if ( clientList ) then
		for client in clientList.entries do
			if ( client.valid and client:GetY() < BOUNDARIES[trialNum].t
				and client:GetY() > BOUNDARIES[trialNum].b
				and client:GetX() < BOUNDARIES[trialNum].l
				and client:GetX() > BOUNDARIES[trialNum].r
			) then
				if ( not client:GetGM() ) then
					n = n + 1;
					if ( n > limit ) then
						client:MovePC(zone, x, y, z, h*2);
						eq.debug(client:GetName().." removed from trial because client limit of "..limit.." exceeded");
						n = n - 1;
					end
				end
			end
		end
	end
end

function MoveGroup(zone, client, dist, x, y, z, h)
	local group = client:GetGroup();
	local raid = client:GetRaid();

	if ( group and group:GroupCount() > 0 ) then
		for i = 0, 5 do
			local member = group:GetMember(i):CastToClient();

			if ( member.valid ) then
				if ( member:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < dist ) then
					member:MovePC(zone, x, y, z, h*2);
					if ( member:GetPet().valid ) then
						if ( member:GetPet():Charmed() ) then
							member:GetPet():BuffFadeByEffect(22); -- charm
						else
							member:GetPet():GMMove(x, y, z, 0);
						end
					end
					eq.get_entity_list():RemoveFromHateLists(member);
				end
			end
		end
		
	elseif ( raid and raid.valid ) then
		local raidGroupID = raid:GetGroup(client:GetName());
		local member;
		for i = 0, 71 do
			member = raid:GetMember(i);
			
			if ( member and member.valid and raid:GetGroup(member:GetName()) == raidGroupID ) then
			
				if ( member:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < dist ) then
					member:MovePC(zone, x, y, z, h*2);
					if ( member:GetPet().valid ) then
						if ( member:GetPet():Charmed() ) then
							member:GetPet():BuffFadeByEffect(22); -- charm
						else
							member:GetPet():GMMove(x, y, z, 0);
						end
					end
					eq.get_entity_list():RemoveFromHateLists(member);
				end
			end
		end		
	else
		client:MovePC(zone, x, y, z, h*2);
		
		if ( client:GetPet().valid ) then
			if ( client:GetPet():Charmed() ) then
				client:GetPet():BuffFadeByEffect(22); -- charm
			else
				client:GetPet():GMMove(x, y, z, 0);
			end
		end
		eq.get_entity_list():RemoveFromHateLists(client);
	end
end

function GovernorTimerEvent(e)
	
	if ( e.timer == "check" ) then
	
		-- check for rooms to reset
		for i = 1, 3 do
			if ( instance[i].state == 4 ) then
				if ( not ClientInTrial(i) ) then
					eq.get_entity_list():GetSpawnByID(MUJAKI_SPAWNIDS[i]):SetTimer(1);
					instance[i].state = 0;
					instance[i].rid = 0;
					instance[i].wave = 0;
					instance[i].ports = 0;
					instance[i].ids = {};
					eq.debug("Mujaki room "..i.." now available");
				end
			end
		end
		
		-- check for too many players in rooms
		for i = 1, 3 do
			if ( instance[i].state > 0 ) then
				CheckRemoveFromTrial(i, 24, 204, 1668, 282, 215, 0);
			end
		end		
		
		-- stop timer if all rooms are state 0
		local stopTimer = true;
		for i = 1, 3 do
			if ( instance[i].state > 0 ) then
				stopTimer = false;
			end
		end
		if ( stopTimer ) then
			eq.stop_timer("check");
		end
		return;
	end
	
	local i = e.timer:sub(-1, -1); -- get last string character
	i = tonumber(i);
	
	if ( not i ) then
		eq.debug("error: could not get instance ID from event string ("..e.timer..")", 1);
		return;
	end
	
	if ( e.timer == "wave1" or e.timer == "wave2" or e.timer == "wave3" ) then
	
		if ( instance[i].wave == 0 ) then
			eq.stop_timer(e.timer); -- shouldn't have to do this but it was bugging out for some reason without it
			eq.set_timer(e.timer, 120000);
			instance[i].state = 2;
			
		elseif ( instance[i].wave == 8 ) then
			instance[i].state = 3;
			eq.stop_timer(e.timer);
			ActivateBoss(i);
			eq.debug("Boss active in Mujaki room "..i, 2);
			return;
		end
		instance[i].wave = instance[i].wave + 1;
		SpawnWave(i);
		eq.debug("Mujaki room "..i.." wave "..instance[i].wave, 2);
		if ( instance[i].wave > 3 and instance[i].wave < 8 ) then
			eq.set_timer("double"..i, 3000);
		end
		
	elseif ( e.timer == "double1" or e.timer == "double2" or e.timer == "double3" ) then
		eq.stop_timer(e.timer);
		SpawnWave(i);
	end
end

function ActivateBoss(i)
	local elist = eq.get_entity_list();
	
	local mujaki = elist:GetSpawnByID(MUJAKI_SPAWNIDS[i]):GetNPC();
	if ( not mujaki.valid or mujaki:GetHP() < 1 ) then
		eq.debug("Error: Could not awaken Mujaki", 1);
		return;
	end
	
	mujaki:SetBodyType(3, false);    -- make targetable (undead type)
	mujaki:SetSpecialAbility(24, 0); -- Will Not Aggro off
	mujaki:SetSpecialAbility(35, 0); -- No Harm from Players off
	eq.set_timer("depop", 1500000, mujaki);

	local npc;
	for id, spawnLoc in pairs(instance[i].ids) do
		if ( spawnLoc == 4 ) then
			npc = elist:GetNPCByID(id);
			if ( npc.valid ) then
				npc:SetBodyType(3, false);    -- make targetable (undead type)
				npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
				npc:SetSpecialAbility(35, 0); -- No Harm from Players off
				eq.set_timer("depop", 1500000, npc);
			end
		end
	end
end

function SpawnWave(i)
	local wave = instance[i].wave;
	local loc, t, mob;
	
	local mujaki = eq.get_entity_list():GetSpawnByID(MUJAKI_SPAWNIDS[i]):GetNPC();
	if ( not mujaki.valid ) then
		eq.debug("error: could not get mujaki mob object from spawn ID", 1);
		return;
	end
	
	for s = 1, 3 do
		loc = SPAWN_LOCS[i][s];
		t = SERVANT_TYPE;
		if ( math.random(100) < 6 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(HELOT_TYPE) ) then
			t = HELOT_TYPE;
		end
		
		mob = eq.spawn2(t, 0, 0, loc.x, loc.y, loc.z, 0);
		instance[i].ids[mob:GetID()] = s;
		mob:CastToNPC():MoveTo(mujaki:GetX(), mujaki:GetY() - 115, mujaki:GetZ(), -1, true);
	end
end

function EtumerSayEvent(e)
	
	if ( e.message:findi("hail") ) then
		e.self:Emote("looks at you with wide, wild eyes.  'Who.. what..   who are you?  If you are a sending from my brother, you will not take me so easily!'");
	
	elseif ( e.message:findi("brother") ) then
		e.self:Say("Mujaki!  Haha! He.. He captured me and..  imprisoned me here as punishment for some supposed transgressions against him.  Mujaki always was jealous of my own prowess and resentful of our fathers favor toward me.  He has only further proven his weakness through trapping me with power granted to him by Terris Thule.  Hmm, perhaps..");
		
	elseif ( e.message:findi("perhaps") ) then
		e.self:Say("Perhaps you could find some way to overwhelm Mujaki?  I might be able to work an enchantment to transport you closer to my brother.  I only feel I have the power to send twenty four of you, when you have formed rank please have the leaders of your groups let me know when you are ready.");
		
	elseif ( e.message:findi("ready") ) then

		-- Port-in logic is: If first group is in a raid, save that raid ID and only allow groups from that raid inside
		--                   If first group is NOT in a raid, allow other non-raid groups inside but not raided groups
		--                   No groups allowed in once waves start or the port limit is reached
		local trial = 0;
		local rid = 0;
		local raid = e.other:GetRaid();
		local raidInTrial = false;
		
		--local group = client:GetGroup();
		--if ( not group.valid ) then
		--	return;
		--end
		
		if ( raid.valid ) then
			rid = raid:GetID();
		end
		
		if ( rid > 0 ) then
			for i = 1, 3 do
			
				if ( instance[i].rid == rid ) then
					raidInTrial = true;
					
					if ( instance[i].state == 1 and instance[i].ports < 4 ) then
						trial = i; -- raid is doing this trial
						break;
					end
				end
			end
			
			if ( not raidInTrial and trial == 0 ) then
				for i = 1, 3 do
					if ( instance[i].state == 0 and not ClientInTrial(i)
					and eq.get_entity_list():GetSpawnByID(MUJAKI_SPAWNIDS[i]):GetNPC().valid
					) then
						trial = i;
						break;
					end
				end
			end
		else
			-- not in a raid
			
			-- try to fill a trial first
			for i = 1, 3 do
				if ( instance[i].rid == 0 and instance[i].state == 1 and instance[i].ports < 4 ) then
					trial = i;
					break;
				end
			end
			
			if ( trial == 0 ) then
				for i = 1, 3 do
					if ( instance[i].state == 0 and not ClientInTrial(i)
					and eq.get_entity_list():GetSpawnByID(MUJAKI_SPAWNIDS[i]):GetNPC().valid
					) then
						trial = i;
						break;
					end
				end
			end
		end
		
		if ( trial > 0 ) then
		
			if ( instance[trial].state == 0 ) then
				instance[trial].state = 1;
				instance[trial].wave = 0;
				instance[trial].rid = rid;
				
				local gov = eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE);
				eq.set_timer("wave"..trial, 120000, gov);
				eq.set_timer("check", 10000, gov);
				
				eq.debug("Mujaki room "..trial.." starting", 1);
			end
			instance[trial].ports = instance[trial].ports + 1;
			eq.debug("Porting group into Mujaki room "..trial.."; raid ID == "..rid, 2);
			MoveGroup(204, e.other, 150, PORT_COORDS[trial].x, PORT_COORDS[trial].y, PORT_COORDS[trial].z, 64);
		else
			e.self:Say("I... I don't think I can muster the force to work this teleportation. Allow me to rest and return to me later, perhaps I can work it then.");
		end		
	end
end

function ServantSpawnEvent(e)
	eq.set_timer("platform", 1000);
end

function ServantTimerEvent(e)
	if ( e.timer == "platform" and not e.self:IsEngaged() ) then
		local i;
		local s;
		local mujaki;
		if ( instance[1].ids[e.self:GetID()] ) then
			i = 1;			
		elseif ( instance[2].ids[e.self:GetID()] ) then
			i = 2;
		elseif ( instance[3].ids[e.self:GetID()] ) then
			i = 3;
		end
		if ( i ) then
			s = instance[i].ids[e.self:GetID()];
			mujaki = eq.get_entity_list():GetSpawnByID(MUJAKI_SPAWNIDS[i]):GetNPC();
		end
		
		if ( s and mujaki and mujaki.valid and mujaki:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < 150 ) then
			local mx = mujaki:GetX();
			local my = mujaki:GetY();
			local mz = mujaki:GetZ();
			local x, y;
			
			if ( s == 1 ) then
				x = mx + math.random(20, 60);
				y = my + math.random(-20, 20);
			elseif ( s == 2 ) then
				x = mx + math.random(-20, 20);
				y = my + math.random(-60, -20);
			elseif ( s == 3 ) then
				x = mx + math.random(-60, -20);
				y = my + math.random(-20, 20);
			end
			
			local rider = eq.spawn2(RIDER_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
			rider:CastToNPC():MoveTo(x, y, mz - 5, -1, true);
			instance[i].ids[rider:GetID()] = 4;
			eq.depop();
		end
	end
end

function MujakiDeathEvent(e)
	local spawnId = e.self:GetSpawnPointID();
	local i = 1;
	
	if ( MUJAKI_SPAWNIDS[2] == spawnId ) then
		i = 2;
	elseif ( MUJAKI_SPAWNIDS[3] == spawnId ) then
		i = 3;
	end
	instance[i].state = 4;
end

function CombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MujakiTimerEvent(e)
	if ( e.timer == "depop" ) then
		local spawnId = e.self:GetSpawnPointID();
		local i = 1;
		
		if ( MUJAKI_SPAWNIDS[2] == spawnId ) then
			i = 2;
		elseif ( MUJAKI_SPAWNIDS[3] == spawnId ) then
			i = 3;
		end
		instance[i].state = 4;
		
		eq.depop_with_timer();
		eq.debug("Mujaki in room "..i.." depoped", 2);
	end
end

function RiderTimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_encounter_load(e)

	eq.register_npc_event("Mujaki", Event.timer, GOVERNOR_TYPE, GovernorTimerEvent);

	eq.register_npc_event("Mujaki", Event.spawn, SERVANT_TYPE, ServantSpawnEvent);
	eq.register_npc_event("Mujaki", Event.timer, SERVANT_TYPE, ServantTimerEvent);
	eq.register_npc_event("Mujaki", Event.spawn, HELOT_TYPE, ServantSpawnEvent);
	eq.register_npc_event("Mujaki", Event.timer, HELOT_TYPE, ServantTimerEvent);
	
	eq.register_npc_event("Mujaki", Event.combat, RIDER_TYPE, CombatEvent);
	eq.register_npc_event("Mujaki", Event.combat, MUJAKI_TYPE, CombatEvent);
	eq.register_npc_event("Mujaki", Event.timer, RIDER_TYPE, RiderTimerEvent);
	eq.register_npc_event("Mujaki", Event.timer, MUJAKI_TYPE, MujakiTimerEvent);
	
	eq.register_npc_event("Mujaki", Event.death, MUJAKI_TYPE, MujakiDeathEvent);

	eq.register_npc_event("Mujaki", Event.say, ETUMER_TYPE, EtumerSayEvent);
end

local GOVERNOR_TYPE = 204458; -- Maze_Checker
local THELIN_OUTSIDE_TYPE = 204070; -- Thelin_Poxbourne
local THELIN_INSIDE_TYPE = 204486; -- Thelin_Poxbourne
local TERRIS_TYPE = 204483; -- Terris_Thule
local NIGHTMARISH_TYPE = 204487; -- nightmarish_construct

local BLOODTHIRSTY_TYPE = 204463; -- a_bloodthirsty_raven
local ABHORRENT_TYPE = 204476; -- an_abhorrent_nightstalker
local SINISTER_TYPE = 204472; -- a_sinister_nightstalker
local THULIAN_TYPE = 204473; -- a_thulian_nightstalker
local AGGRESSOR_TYPE = 204477; -- an_aggressor_arachnid
local CONSTRUCT_TYPE = 204464; -- a_construct_of_nightmares
local MOB_TYPES = { BLOODTHIRSTY_TYPE, ABHORRENT_TYPE, SINISTER_TYPE, THULIAN_TYPE, AGGRESSOR_TYPE, CONSTRUCT_TYPE };

local THELIN_SPAWNIDS = { 346002, 346001, 346000 }; -- note: this order is important; starts top to bottom
local BOUNDARIES = {
	{ t = 6550, l = -4000, r = -5100, b = 5550 },
	{ t = 5550, l = -4000, r = -5100, b = 4550 },
	{ t = 4550, l = -4000, r = -5100, b = 3500 }
};
local PORT_COORDS = {
	{ x = -4466, y = 5642, z = 5 },		-- Maze Sending1 1159
	{ x = -4466, y = 4642, z = 5 },		-- Maze Sending2 1160
	{ x = -4466, y = 3642, z = 5 }		-- Maze Sending3 1161
};

--[[
		States:
			0 = Maze available for use
			1 = A group ported up but didn't start it
			2 = Thelin is wandering
			3 = Boss spawned; Thelin accepting dagger blade shard from boss
			4 = Thelin and Terris dialog complete; hailing Thelin ports you out
			5 = Thelin despawned; waiting for cleanup to allow reuse
]]
local instance = {
	{ rid = 0, ports = 0, state = 0, ids = {}, terris = nil },
	{ rid = 0, ports = 0, state = 0, ids = {}, terris = nil },
	{ rid = 0, ports = 0, state = 0, ids = {}, terris = nil }
};

function GetInstanceFromSpawnID(spawnId)
	local i;
	
	if ( THELIN_SPAWNIDS[1] == spawnId ) then
		i = 1;
	elseif ( THELIN_SPAWNIDS[2] == spawnId ) then
		i = 2;
	elseif ( THELIN_SPAWNIDS[3] == spawnId ) then
		i = 3;
	end
	return i;
end

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
						if ( client:GetPet().valid and not client:GetPet():Charmed() ) then
							client:GetPet():GMMove(x, y, z, 0);
						end
						if ( limit > 0 ) then
							eq.debug(client:GetName().." removed from trial because client limit of "..limit.." exceeded");
						end
						n = n - 1;
					end
				end
			end
		end
	end
end

function RemoveNearbyFromTrial(i, zone, dist, ox, oy, x, y, z, h)
	local clientList = eq.get_entity_list():GetClientList();

	if ( clientList ) then
		for client in clientList.entries do
			if ( client.valid and not client:GetGM()
				and client:GetY() < (oy+dist) and client:GetY() > (oy-dist)
				and client:GetX() < (ox+dist) and client:GetX() > (ox-dist)
			) then
				client:MovePC(zone, x, y, z, h*2);
				if ( client:GetPet().valid and not client:GetPet():Charmed() ) then
					client:GetPet():GMMove(x, y, z, 0);
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
			if ( instance[i].state == 5 or instance[i].state == 1 ) then
				if ( not ClientInTrial(i) ) then
					instance[i].state = 0;
					instance[i].rid = 0;
					instance[i].ports = 0;
					instance[i].ids = {};
					if ( instance[i].terris ) then
						instance[i].terris:Depop();
					end
					instance[i].terris = nil;
					eq.debug("Hedge maze "..i.." now available");
				end
			end
		end
		
		-- check for too many players in rooms
		for i = 1, 3 do
			if ( instance[i].state > 0 ) then
				CheckRemoveFromTrial(i, 18, 204, 1668, 282, 215, 0);
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
			eq.stop_timer(e.timer);
		end
		return;
	end
end

function ThelinWaypointEvent(e)
	local i = GetInstanceFromSpawnID(e.self:GetSpawnPointID());
	local offset = 1000 - (i * 1000);
	local nc;
	
	if ( e.wp == 26 ) then
		e.self:Emote("kneels down and picks up a dagger hilt.");
		eq.spawn2(SINISTER_TYPE, 0, 0, -4725, 6249+offset, 5, 0);
		eq.spawn2(SINISTER_TYPE, 0, 0, -4726, 6244+offset, 5, 0);
		nc = eq.spawn2(NIGHTMARISH_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

	elseif ( e.wp == 46 ) then
		e.self:Emote("slowly picks up a shard of a dagger blade.");
		eq.spawn2(ABHORRENT_TYPE, 0, 0, -4757, 6092+offset, 5, 0);
		eq.spawn2(BLOODTHIRSTY_TYPE, 0, 0, -4755, 6091+offset, 5, 0);
		eq.spawn2(BLOODTHIRSTY_TYPE, 0, 0, -4756, 6094+offset, 5, 0);
		nc = eq.spawn2(NIGHTMARISH_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

	elseif ( e.wp == 57 ) then
		e.self:Emote("picks up a the top half of a dagger blade.");
		eq.spawn2(AGGRESSOR_TYPE, 0, 0, -4923, 5735+offset, 5, 0);
		eq.spawn2(ABHORRENT_TYPE, 0, 0, -4921, 5735+offset, 5, 0);
		eq.spawn2(SINISTER_TYPE, 0, 0, -4924,5735+offset, 5, 0);
		eq.spawn2(THULIAN_TYPE, 0, 0, -4922, 5733+offset, 5, 0);
		nc = eq.spawn2(NIGHTMARISH_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
		
	elseif ( e.wp == 71 ) then
		e.self:Emote("picks up a dagger handle with a small hole in it.");
		eq.spawn2(AGGRESSOR_TYPE, 0, 0, -4144, 5620+offset, 5, 0);
		eq.spawn2(ABHORRENT_TYPE, 0, 0, -4142, 5620+offset, 5, 0);
		eq.spawn2(THULIAN_TYPE, 0, 0, -4143, 5625+offset, 5, 0);
		eq.spawn2(THULIAN_TYPE, 0, 0, -4140, 5625+offset, 5, 0);
		eq.spawn2(BLOODTHIRSTY_TYPE, 0, 0, -4141, 5623+offset, 5, 0);
		nc = eq.spawn2(NIGHTMARISH_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

	elseif ( e.wp == 88 ) then
		e.self:Emote("picks up a small gem to place inside the handle.");
		eq.spawn2(AGGRESSOR_TYPE, 0, 0, -4268, 5892+offset, 5, 0);
		eq.spawn2(AGGRESSOR_TYPE, 0, 0, -4263, 5895+offset, 5, 0);
		eq.spawn2(ABHORRENT_TYPE, 0, 0, -4265, 5890+offset, 5, 0);
		eq.spawn2(SINISTER_TYPE, 0, 0, -4267, 5890+offset, 5, 0);
		eq.spawn2(THULIAN_TYPE, 0, 0, -4264, 5896+offset, 5, 0);
		eq.spawn2(BLOODTHIRSTY_TYPE, 0, 0, -4266, 5894+offset, 5, 0);
		nc = eq.spawn2(NIGHTMARISH_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

	elseif ( e.wp == 99 ) then
		e.self:Emote("kneels down and picks up a dagger blade tip.");
		eq.spawn2(AGGRESSOR_TYPE, 0, 0, -4430, 6368+offset, 5, 0);
		eq.spawn2(AGGRESSOR_TYPE, 0, 0, -4435, 6368+offset, 5, 0);
		eq.spawn2(ABHORRENT_TYPE, 0, 0, -4433, 6365+offset, 6.75, 0);
		eq.spawn2(SINISTER_TYPE, 0, 0, -4431, 6367+offset, 6.75, 0);
		eq.spawn2(THULIAN_TYPE, 0, 0, -4434, 6369+offset, 6.75, 0);
		eq.spawn2(BLOODTHIRSTY_TYPE, 0, 0, -4432, 6366+offset, 6.25, 0);
		nc = eq.spawn2(NIGHTMARISH_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);

	elseif ( e.wp == 106 ) then
		eq.spawn2(CONSTRUCT_TYPE, 0, 0, -4550, 6118+offset, 5, 0);
		instance[i].state = 3;
		eq.set_timer("depop", 7200000); -- so maze doesn't get stuck in an unusuable state in case nobody turns in boss item
		
	elseif ( e.wp == 108 ) then
		eq.set_timer("talk1", 5000);
	end
	
	if ( nc ) then
		table.insert(instance[i].ids, nc:GetID());
	end
end

function ThelinTradeEvent(e)
	local i = GetInstanceFromSpawnID(e.self:GetSpawnPointID());	
	local item_lib = require("items");
	
	if ( instance[i].state == 3 and item_lib.check_turn_in(e.self, e.trade, {item1 = 9258}) ) then -- Dagger Blade Shard
		e.self:Emote("takes the final shard from you and places all of the pieces on the ground, with unseen hands the dagger moves together and fuses itself back together into one complete piece.  Thelin picks it up and hands it to you.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 9259); -- Thelin's Dagger
		e.self:SetRunning(true);
		e.self:ResumeWandering();
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players on
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro on
		e.self:SetSpecialAbility(25, 1); -- Immune to Aggro on
		
		local offset = 1000 - (i * 1000);
		instance[i].terris = eq.spawn2(TERRIS_TYPE, 0, 0, -4532, 5950+offset, 8, 0);
		eq.set_timer("depop", 1500000);
	end

	item_lib.return_items(e.self, e.other, e.trade);
end	


function ThelinOutsideSayEvent(e)

	local qglobals = eq.get_qglobals(e.other);

	if ( not qglobals.thelin ) then
		if ( e.message:findi("hail") ) then
			e.other:Message(0, "Thelin Poxbourne screams loudly, and then falls asleep once again.");
		end
		return;
	end

	if ( e.message:findi("hail") ) then
		e.other:Message(0, "Thelin Poxbourne tells you, 'Who is it?  Are you.. really there?  You are!  Please I beg of you to help me escape from this horrid place.  Terris Thule is holding me here, she delights in the nightmares she sends me.  To further torture me, she has offered me a pact.  She has said that if I can retrieve my [dagger], then I am free to go.  She does this only because she knows that I cannot retrieve it on my own.'");
	
	elseif ( e.message:findi("dagger") ) then
		e.other:Message(0, "Thelin Poxbourne tells you, 'She has taken the only thing that has brought me any joy in my life.  She took it and broke it into seven pieces.  She placed them deep within the labyrinth of my nightmare.  I must retrieve it, will you [help] me.  Please I beg of your mercy.'");
		
	elseif ( e.message:findi("help") ) then
		e.other:Message(0, "Thelin Poxbourne tells you, 'I do not know who you are, but I am thankful that you have stumbled upon me.  I can bring you into my dream state, but my powers are limited so I can only handle eighteen at once.  Please when you are prepared have the leader of each of your band of adventurers tell me they are ready.'");
		
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
					
					if ( instance[i].state == 1 and instance[i].ports < 3 ) then
						trial = i; -- raid is doing this trial
						break;
					end
				end
			end
			
			if ( not raidInTrial and trial == 0 ) then
				for i = 1, 3 do
					if ( instance[i].state == 0 and not ClientInTrial(i) ) then
						trial = i;
						break;
					end
				end
			end
		else
			-- not in a raid
			
			-- try to fill a trial first
			for i = 1, 3 do
				if ( instance[i].rid == 0 and instance[i].state == 1 and instance[i].ports < 3 ) then
					trial = i;
					break;
				end
			end
			
			if ( trial == 0 ) then
				for i = 1, 3 do
					if ( instance[i].state == 0 and not ClientInTrial(i) ) then
						trial = i;
						break;
					end
				end
			end
		end
		
		if ( trial > 0 ) then
		
			e.self:Emote("closes his eyes and falls asleep immediately.  He looks peaceful for a moment and then screams in agony!");
			
			if ( instance[trial].state == 0 ) then
				instance[trial].state = 1;
				instance[trial].rid = rid;
				
				local gov = eq.get_entity_list():GetMobByNpcTypeID(GOVERNOR_TYPE);
				eq.set_timer("check", 10000, gov);
				
				eq.debug("Hedge Maze "..trial.." starting", 1);
			end
			instance[trial].ports = instance[trial].ports + 1;
			eq.debug("Porting group into hedge maze "..trial.."; raid ID == "..rid, 2);
			MoveGroup(204, e.other, 150, PORT_COORDS[trial].x, PORT_COORDS[trial].y, PORT_COORDS[trial].z, 64);
		else
			e.self:Emote("groans in agony. 'I suddenly feel the grasp of Terris upon my heart.  I must.. rest.  Can you please come back after I have rested.'");
		end		
	end
end

function ThelinInsideSayEvent(e)
	local i = GetInstanceFromSpawnID(e.self:GetSpawnPointID());

	if ( instance[i].state == 1 ) then

		if ( e.message:findi("hail") ) then
			e.self:Say("Has everyone made it here safely?  When you tell me I will seal off my dream and we can begin.  We must be careful here, visions await around every turn.  Are you ready to follow?  I know where all the pieces of the dagger are, but I cannot collect them all on my own.");

		elseif ( e.message:findi("ready") ) then
			e.self:Say("Please stay close, I know not what horror Terris will unleash upon us.");
			e.self:CastToNPC():SetNoQuestPause(true); -- do not pause on say events
			e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
			e.self:CastToNPC():SetCastRateDetrimental(35); -- this should really be implemented as an NPC database field
			                                               -- this NPC is a shadowknight but casts necro spells; needs to cast aggressively as well
			e.self:AssignWaypoints(8+i);
			instance[i].state = 2;
		end
		
	elseif ( instance[i].state == 4 ) then
	
		if ( e.message:findi("hail") ) then

			local qglobals = eq.get_qglobals(e.other);
			
			if ( not qglobals.thelin ) then
				e.other:Message(0, "Thelin Poxbourne tells you, 'I do not recognize your face. Are you a vision sent by Terris?!  Begone from my thoughts and begone from my dreams!'");
				eq.set_global("cl_maze", "1", 5, "F");
				e.other:Message(15, "You have received a new checklist flag!");
		
			else
				e.other:Message(0, "Thelin Poxbourne tells you, 'Please destroy her for all that have had to endure her hideous visions.'  Thelin closes his eyes and is swept away from his nightmare.  The land of pure thought begins to vanish from around you.");
				
				if ( qglobals.thelin == "1" ) then
					eq.set_global("thelin", "2", 5, "F");
					e.other:Message(15, "You have received a character flag!");
					
					if ( qglobals.cl_maze ) then
						eq.delete_global("cl_maze");
					end
				end				
			end
			
			e.self:CastSpell(1195, e.other:GetID()); -- Waking Moment
		end
	end
end

function ThelinTimerEvent(e)
	local i = GetInstanceFromSpawnID(e.self:GetSpawnPointID());

	if ( e.timer == "talk1" ) then
		e.self:Say("Terris hear me now!  I have done as you have called for.  My beloved dagger is whole once again!  Come now keep up your part of the bargain.");
		instance[i].terris:Say("You fool!  You did not earn this prize on your own!  The contract that has been drawn is now invalid.  You will never leave my grasp, prepare your soul for eternal torment!");
		eq.set_timer("talk2", 8000);
	
	elseif ( e.timer == "talk2" ) then
		e.self:Say("Vile wench, I knew in the end it would come to this.  You shall pay dearly for your injustice here.");
		instance[i].terris:Emote("laughs heartily and then vanishes in a swirl of incorporeal mist.");
		instance[i].terris:CastSpell(36, e.self:GetID()); -- Gate
		eq.set_timer("talk3", 8000);
		eq.set_timer("terrisdepop", 2000);
	
	elseif ( e.timer == "terrisdepop" ) then
		instance[i].terris:Depop();
		instance[i].terris = nil;
	
	elseif ( e.timer == "talk3" ) then
		e.self:Say("So then my hope is nearly lost.  Take with you my dagger.  Plunge it deep into her soulless heart.  If I cannot escape from this plane under her rules, I shall make my own!");
		eq.set_timer("depop", 600000);
		instance[i].state = 4;
		eq.debug("Hedge Maze "..i.." success");
		
	elseif ( e.timer == "depop" ) then
		instance[i].state = 5;
		eq.depop_with_timer();
	end
	eq.stop_timer(e.timer);
end

function ThelinDeathEvent(e)
	local i = GetInstanceFromSpawnID(e.self:GetSpawnPointID());	
	
	local mob;
	for _, id in ipairs(instance[i].ids) do
		mob = eq.get_entity_list():GetNPCByID(id);
		if ( mob and mob.valid ) then
			mob:CastSpell(3073, id); -- Banishment of Nightmares
		end
	end
	-- have to remove players this way because Banishment doesn't work since it's flagged a beneficial spell
	RemoveNearbyFromTrial(i, 204, 100, e.self:GetX(), e.self:GetY(), 1668, 282, 213, 255);
	instance[i].state = 5;
	eq.debug("Hedge Maze "..i.." failed");
end

function MobSpawnEvent(e)
	eq.set_timer("depop", 1200000);
end

function MobTimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function CombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	eq.register_npc_event("Maze", Event.timer, GOVERNOR_TYPE, GovernorTimerEvent);
	
	eq.register_npc_event("Maze", Event.timer, THELIN_INSIDE_TYPE, ThelinTimerEvent);
	eq.register_npc_event("Maze", Event.waypoint_arrive, THELIN_INSIDE_TYPE, ThelinWaypointEvent);
	eq.register_npc_event("Maze", Event.trade, THELIN_INSIDE_TYPE, ThelinTradeEvent);
	eq.register_npc_event("Maze", Event.death_complete, THELIN_INSIDE_TYPE, ThelinDeathEvent);

	eq.register_npc_event("Maze", Event.say, THELIN_OUTSIDE_TYPE, ThelinOutsideSayEvent);
	eq.register_npc_event("Maze", Event.say, THELIN_INSIDE_TYPE, ThelinInsideSayEvent);

	eq.register_npc_event("Maze", Event.spawn, NIGHTMARISH_TYPE, MobSpawnEvent);
	eq.register_npc_event("Maze", Event.timer, NIGHTMARISH_TYPE, MobTimerEvent);

	for _, id in ipairs(MOB_TYPES) do
		eq.register_npc_event("Maze", Event.spawn, id, MobSpawnEvent);
		eq.register_npc_event("Maze", Event.timer, id, MobTimerEvent);
		eq.register_npc_event("Maze", Event.combat, id, CombatEvent);
	end
end

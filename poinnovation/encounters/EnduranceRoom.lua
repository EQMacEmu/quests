local CONTROLLER_TYPE = 206094; -- Endurance_Listener
local KAEON_TYPE = 206045; -- #Researcher_Kaeon
local KELRIG_TYPE = 206204; -- #Assistant_Kelrig

local CONTRAPTION_TYPE = 206199; -- a_manaetic_contraption
local GADGET_TYPE = 206201; -- a_manaetic_gadget
local MECH_TYPE = 206202; -- a_persistent_mechanization
local DEVICE1_TYPE = 206200; -- a_manaetic_device
local DEVICE2_TYPE = 206205; -- a_manaetic_device
local DEVICE3_TYPE = 206206; -- a_manaetic_device
local DEVICE4_TYPE = 206207; -- a_manaetic_device
local MOBS = { CONTRAPTION_TYPE, GADGET_TYPE, MECH_TYPE, DEVICE1_TYPE, DEVICE2_TYPE, DEVICE3_TYPE, DEVICE4_TYPE };

local WAVE_SPAWN_NUMS = { 3, 4, 6, 8, 4, 4, 8, 7 };
local TOTAL_SPAWNS_NUM = 0;
for _, v in ipairs(WAVE_SPAWN_NUMS) do TOTAL_SPAWNS_NUM = TOTAL_SPAWNS_NUM + v; end
local WAVE_SPAWN_LOCS = {
	{ x = -405, y = -736 },
	{ x = -267, y = -875 },
	{ x = -315, y = -875 },
	{ x = -320, y = -644 },
	{ x = -175, y = -785 },
	{ x = -405, y = -786 },
	{ x = -265, y = -644 },
	{ x = -175, y = -736 },
};
local ROOM1Z = 0;
local ROOM2Z = -172.9;
	
local room = {
	{ occupied = false, wave = 0, runs = 0, mobs = {}, kills = 0 },
	{ occupied = false, wave = 0, runs = 0, mobs = {}, kills = 0 }
};

function ControllerSignal(e)

	if ( e.signal == 1 or e.signal == 2 ) then
		eq.set_timer("room"..e.signal.."wave", 120000);
		eq.set_timer("reset"..e.signal, 1800000);
		eq.stop_timer("room"..e.signal.."check");
		room[e.signal].occupied = true;
		room[e.signal].mobs = {};
		room[e.signal].wave = 0;
		room[e.signal].kills = 0;
		eq.debug("Endurance Room "..e.signal.." starting round "..(room[e.signal].runs + 1), 1);
		
	elseif ( e.signal == 3 or e.signal == 4 ) then
		local roomNum = e.signal - 2;
		eq.set_timer("reset"..roomNum, 720000);
	end
end

function ControllerTimer(e)

	if ( e.timer == "room1wave" or e.timer == "room2wave" ) then
		local r = 1;
		if ( e.timer == "room2wave" ) then
			r = 2;
		end
	
		room[r].wave = room[r].wave + 1;
		
		if ( room[r].wave < 8 ) then
			eq.set_timer(e.timer, (math.random(0, 21) + 107) * 1000);
		else
			eq.stop_timer(e.timer);
		end
		SpawnWave(r);
		
	elseif ( e.timer == "reset1" or e.timer == "reset2" ) then
		local r = 1;
		if ( e.timer == "reset2" ) then
			r = 2;
		end
		eq.stop_timer(e.timer);
		eq.stop_timer("room"..r.."wave");
		eq.set_timer("room"..r.."check", 3000000);
		
		if ( room[r].kelrig and room[r].kelrig.valid ) then
			room[r].kelrig:Depop();
			room[r].kelrig = nil;
		end
		room[r].occupied = false;
		room[r].mobs = {};
		room[r].runs = 0;
		room[r].kills = 0;
		room[r].wave = 0;
		eq.debug("Endurance Room "..r.." now available", 1);
		
	elseif ( e.timer == "room1check" or e.timer == "room2check" ) then
		eq.stop_timer(e.timer);
		local r = 1;
		if ( e.timer == "room2check" ) then
			r = 2;
		end
		if ( not room[r].occupied and MobInTrial(r) ) then
			eq.signal(CONTROLLER_TYPE, r);	-- event starts up again if people stay inside ~hour
		end
	end
end

function SpawnWave(r)
	local numSpawns = WAVE_SPAWN_NUMS[room[r].wave];
	local loc, t, deviceSpawned, typeId, z, z2, mob;
	local spawnLocs = {};
	
	if ( numSpawns > 8 ) then
		numSpawns = 8;
	end
	eq.debug("spawning "..numSpawns.." mobs in wave "..room[r].wave.." of room "..r, 2);
	
	if ( r == 1 ) then
		z = 66;
		z2 = ROOM1Z + 1.25;
	else
		z = -103;
		z2 = ROOM2Z + 1.25;
	end
	
	for i = 1, numSpawns do
	
		loc = math.random(1, 8);		
		while (spawnLocs[loc]) do
			loc = math.random(1, 8);
		end
		
		spawnLocs[loc] = true;
	end
	
	for i = 1, 8 do
		if ( spawnLocs[i] and WAVE_SPAWN_LOCS[i] ) then
			t = math.random(1, 3);
			if ( room[r].wave == 8 and not deviceSpawned ) then
				t = 4;
				deviceSpawned = true;
			end
			
			if ( t == 1 ) then
				typeId = CONTRAPTION_TYPE;
			elseif ( t == 2 ) then
				typeId = GADGET_TYPE;
			elseif ( t == 3 ) then
				typeId = MECH_TYPE;
			elseif ( t == 4 ) then
				if ( room[r].runs <= 1 ) then
					typeId = DEVICE1_TYPE;
				elseif ( room[r].runs == 2 ) then
					typeId = DEVICE2_TYPE;
				elseif ( room[r].runs == 3 ) then
					typeId = DEVICE3_TYPE;
				elseif ( room[r].runs >= 4 ) then
					typeId = DEVICE4_TYPE;
				end
			end
			
			mob = eq.spawn2(typeId, 0, 0, WAVE_SPAWN_LOCS[i].x, WAVE_SPAWN_LOCS[i].y, z, 0);
			table.insert(room[r].mobs, mob:GetID());
			mob:CastToNPC():MoveTo(-290, -760, z2, -1, true);
		end
	end
end

function MobSpawn(e)
	eq.set_timer("depop", 720000);
end

function MobTimer(e)

	if ( e.timer == "depop" ) then
		local myId = e.self:GetID();
		
		for roomNum = 1, 2 do
			for i, id in ipairs(room[roomNum].mobs) do
				if ( id == myId ) then
					table.remove(room[roomNum].mobs, i);
					break;
				end
			end
		end
		eq.depop();
	end
end

function MobCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MobDeath(e)
	local myId = e.self:GetID();
	local roomNum;
	
	for r = 1, 2 do
		for i, id in ipairs(room[r].mobs) do
			if ( id == myId ) then
				table.remove(room[r].mobs, i);
				room[r].kills = room[r].kills + 1;
				roomNum = r;
				break;
			end
		end
	end
	
	if ( roomNum and room[roomNum].wave == 8 and room[roomNum].kills > (TOTAL_SPAWNS_NUM - 15) and e.self:GetCleanName() == "a manaetic device" ) then
		local z = ROOM1Z + 9.376;
		if ( roomNum == 2 ) then
			z = ROOM2Z + 9.376;
		end
		room[roomNum].kelrig = eq.spawn2(KELRIG_TYPE, 0, 0, -196, -759, z, 192);
		room[roomNum].runs = room[roomNum].runs + 1;
		eq.signal(CONTROLLER_TYPE, roomNum + 2);
		eq.debug("Endurance Room "..roomNum.." successfully finished", 1);
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
					if ( member:GetPet().valid and not member:GetPet():Charmed() ) then
						member:GetPet():GMMove(x, y, z, 0);
					end
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
					if ( member:GetPet().valid and not member:GetPet():Charmed() ) then
						member:GetPet():GMMove(x, y, z, 0);
					end
				end
			end
		end		
	else
		client:MovePC(zone, x, y, z, h*2);
		if ( client:GetPet().valid and not client:GetPet():Charmed() ) then
			client:GetPet():GMMove(x, y, z, 0);
		end
	end
end

function MoveCorpses(roomNum)
	local corpseList = eq.get_entity_list():GetCorpseList();
	local minZ, maxZ;
	if ( roomNum == 1 ) then
		minZ = -1;
		maxZ = 500;
	else
		minZ = -500;
		maxZ = -1;
	end

	if ( corpseList ) then
		for corpse in corpseList.entries do
			if ( corpse.valid and corpse:GetY() < -500 and corpse:GetY() > -1000
				and corpse:GetX() < -150 and corpse:GetX() > -500
				and corpse:GetZ() < maxZ and corpse:GetZ() > minZ
			) then
				if ( corpse:IsPlayerCorpse() ) then
					corpse:MoveToGraveyard();
				end
			end
		end
	end
end

function MobInTrial(roomNum)
	local mobList = eq.get_entity_list():GetMobList();
	local minZ, maxZ;
	if ( roomNum == 1 ) then
		minZ = -1;
		maxZ = 500;
	else
		minZ = -500;
		maxZ = -1;
	end

	if ( mobList ) then
		for mob in mobList.entries do
			if ( mob.valid and mob:GetY() < -500 and mob:GetY() > -1000
				and mob:GetX() < -150 and mob:GetX() > -500
				and mob:GetZ() < maxZ and mob:GetZ() > minZ
			) then
				if ( mob:IsClient() and not mob:CastToClient():GetGM() ) then
					return true;
				end
				if ( mob:IsNPC() and not mob:IsPet() and mob:GetRace() ~= 127 and mob:GetRace() ~= 216 ) then -- invis man, Horse
					return true;
				end
			end
		end
	end
	return false;
end

function KaeonSay(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Salutations.  We have been monitoring your performance in the scrap yards.  Your ability seems to rival your physical capabilities.  We would like to test your endurance and mental abilities further.  Would you comply to endurance testing?");
		
	elseif ( e.message:findi("comply to endurance testing") ) then
		e.self:Say("Excellent.  We would like to test a maximum of six at one time.  Are you ready to begin testing?");
		
	elseif ( e.message:findi("ready") ) then
	
		local room1available = not MobInTrial(1);
		local room2available = not MobInTrial(2);
		if ( room[1].occupied ) then
			room1available = false;
		end
		if ( room[2].occupied ) then
			room2available = false;
		end
		
		if ( not room1available and not room2available ) then
			e.self:Say("Sorry that testing lab is currently resetting from previous use.");
		else
		
			local roomNum = 1;
			local z = 5;
			if ( not room1available ) then
				roomNum = 2;
				z = -165;
			end
			e.self:Say("Excellent I will now send you down to the testing bay.  Assistant Kelrig will be there shortly with further instructions.");
			MoveCorpses(roomNum);
			MoveGroup(206, e.other:CastToClient(), 150, -274, -760, z, 0);
			eq.signal(CONTROLLER_TYPE, roomNum);
		end
	end
end

function KelrigSay(e)

	local roomNum;
	if ( room[1].kelrig and room[1].kelrig:GetID() == e.self:GetID() ) then
		roomNum = 1;
	elseif ( room[2].kelrig and room[2].kelrig:GetID() == e.self:GetID() ) then
		roomNum = 2;
	end
	
	if ( e.message:findi("hail") ) then
		if ( not roomNum or room[roomNum].runs < 2 ) then
			e.self:Say("Interesting, your abilities have shown you to be sufficient.  We would like to continue testing, are you ready to continue or would you like to quit here?");
		elseif ( room[roomNum].runs == 2 ) then
			e.self:Say("Once again you have provided sufficient data.  More data is required, are you ready to continue or do you need to quit here?");
		elseif ( room[roomNum].runs == 3 ) then
			e.self:Say("Data shows you working above the standards of other mortals, what is the extra factor to your success?  You must continue, are you ready or do you need to quit here?");
		elseif ( room[roomNum].runs > 3 ) then
			e.self:Say("Excellent.  This data will be of great use to us.  Thank you for your time.  Goodbye.");
			e.self:CastSpell(1090, e.other:GetID()); -- Mechinetic Dislocation IV
		end
		
	elseif ( roomNum and e.message:findi("ready") ) then
		e.self:Say("Your cooperation is appreciated, prepare yourselves.");
		
		room[roomNum].kelrig = nil;
		eq.signal(CONTROLLER_TYPE, roomNum);
		e.self:Depop();
		
	elseif ( e.message:findi("quit") ) then
		e.self:Say("We shall process the data that you have afforded us.  Good bye.");
		e.self:CastSpell(1090, e.other:GetID()); -- Mechinetic Dislocation IV
	end
end

function event_encounter_load(e)
	eq.register_npc_event("EnduranceRoom", Event.signal, CONTROLLER_TYPE, ControllerSignal);
	eq.register_npc_event("EnduranceRoom", Event.timer, CONTROLLER_TYPE, ControllerTimer);

	eq.register_npc_event("EnduranceRoom", Event.say, KAEON_TYPE, KaeonSay);
	eq.register_npc_event("EnduranceRoom", Event.say, KELRIG_TYPE, KelrigSay);

	for _, id in ipairs(MOBS) do
		eq.register_npc_event("EnduranceRoom", Event.spawn, id, MobSpawn);
		eq.register_npc_event("EnduranceRoom", Event.timer, id, MobTimer);
		eq.register_npc_event("EnduranceRoom", Event.combat, id, MobCombat);
		eq.register_npc_event("EnduranceRoom", Event.death, id, MobDeath);
	end
end

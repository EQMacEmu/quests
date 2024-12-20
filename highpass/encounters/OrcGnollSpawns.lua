--[[
Orcs and gnolls have strange spawn behavior in the old version of Highpass.  Sony seems to have scripted it somehow.
Some of the spawns will happen simultaneously.  This script is a crude attempt to replicate the behavior based on old comments,
as the original zone is no longer observable.

Allakhazam comments
-------------------
2004 comment:
"The mob spawn really needs looked at. I think its messed up, I know everyone says crap like that, but I have been playing 4 years, and its very eratic.
They will spawn like 4 then like 8 and none... none... Its hard to explain, the gnolls do it, and the goblins in HHK do it also."

2002 comments:
"even the superspawn (when about 8 orcs spawn at once)"

2001 comments:
"Unfortunately, before I can sit down six Gnolls spawn simultaneously from the spawn point and make a beeline to my pet"
"I was later told that spawns with three or more monsters is possible. I've seen that before,"
"be VERY careful in HPH in the orc area, there can be MASSIVE pops where about 15 can spawn within 15 seconds...this can be tricky when you have 4 medics, a couple a fanatics, a named orc, and half a dozen warriors and assorted orcs all beatin atcha"
"That spawn can be either a Champion, Vexven, Grenix, or just a Flamepaw. Also All but the named Gnolls can spawn randomly at any time. There seemed to be no pattern of this."

2000 comments:
"if you park on the spawn point, it's easy to get swarmed. The spawn is *fast.*" (referring to orcs)
"Controlling this spawn is much easier than for orcs." (referring to gnolls)
"4) the gnoll spawn..while often less camped is a slower spawn and is way to near to the tower guards"
"Gnoll ledge is a not so fast spawn rate but good exp otherwise"


AK log comments:
[Tue Dec  6 02:03:01 2005] Frer tells the group, 'there are like 8 orc spawns'
[Tue Dec  6 02:04:50 2005] Frer tells the group, 'if you need to afk, stand here, uninvis, because all the spawns walk this way after a short period of time'


note: In AK logs, high levels were killing orcs roughly 70-90 kills an hour.  (can't really know if they briefly left the area or not, so hard to estimate)
      Also, evidence of simultaneous orc spawns are consistently seen about six minutes apart. (based on kill message times)
]]

local ORC_TYPES = { 5002, 5014, 5082, 5085, 5012, 5001, 5089, 5084, 5130 };
local GNOLL_TYPES = { 5075, 5110, 5113, 5124, 5076, 5081 };
local ORC_SPAWNIDS = { 368035, 368036, 368620, 368621, 368622, 369371, 336267 };
local GNOLL_SPAWNIDS = { 368614, 368616, 368617, 368618 }; -- leaving out some spawns because all 8 seems too much

function IsValueInTable(t, v)
	for k, v2 in ipairs(t) do
		if ( v == v2 ) then
			return true;
		end
	end
	return false;
end

function OrcSpawnEvent(e)

	if(e.self:GetGrid() > 0) then
		e.self:PauseWandering(20);
	end
	
	if ( e.self:GetSpawnPointID() == 336266 ) then -- controller spawn; 6 minutes
	
		local roll = math.random(0, #ORC_SPAWNIDS);
		local spawnIDs = {};
		local attempts = 0;
		local id;
		
		while (#spawnIDs < roll and attempts < 100) do
			
			id = ORC_SPAWNIDS[math.random(1, #ORC_SPAWNIDS)];
			if ( not IsValueInTable(spawnIDs, id) ) then
				table.insert(spawnIDs, id);
			end
			
			attempts = attempts + 1;
		end
		
		local elist = eq.get_entity_list();
		for _, id in ipairs(spawnIDs) do
			elist:GetSpawnByID(id):SetTimer(1);
		end
		eq.debug("Orc spawn wave: "..(roll + 1).." orcs"); -- these won't spawn if they are already spawned
	end
	
	
end

function GnollSpawnEvent(e)

	if(e.self:GetGrid() > 0) then
		e.self:PauseWandering(20);
	end
	
	if ( e.self:GetSpawnPointID() == 368619 ) then -- controller spawn; 10 minutes
	
		local roll = math.random(0, #GNOLL_SPAWNIDS);
		local spawnIDs = {};
		local attempts = 0;
		local id;
		
		while (#spawnIDs < roll and attempts < 100) do
			
			id = GNOLL_SPAWNIDS[math.random(1, #GNOLL_SPAWNIDS)];
			if ( not IsValueInTable(spawnIDs, id) ) then
				table.insert(spawnIDs, id);
			end
			
			attempts = attempts + 1;
		end
		
		local elist = eq.get_entity_list();
		for _, id in ipairs(spawnIDs) do
			elist:GetSpawnByID(id):SetTimer(1);
		end
		eq.debug("Gnoll spawn wave: "..(roll + 1).." gnolls");
	end
	
end

function event_encounter_load(e)

	for _, id in ipairs(ORC_TYPES) do
		eq.register_npc_event("OrcGnollSpawns", Event.spawn, id, OrcSpawnEvent);
	end
	for _, id in ipairs(GNOLL_TYPES) do
		eq.register_npc_event("OrcGnollSpawns", Event.spawn, id, GnollSpawnEvent);
	end

end

-- This replicates the 'infinte miner' bug where one of the miner spawns inside the mine spawns a ton of grimlings
-- on AK it was limited to 100 possible and seemed to grow after every clear

local MINER_TYPE = 167042;		-- a_grimling_miner
local SPAWN_ID = 334821;
local LIMIT = 30;

local totalSpawns = 1;

function CountMiners()
	local npcList = eq.get_entity_list():GetNPCList();
	local count = 0;
	
	if ( npcList ) then
	
		for npc in npcList.entries do

			if ( npc.valid and npc:GetNPCTypeID() == MINER_TYPE ) then
				count = count + 1;
			end
		end
	end
	return count;
end

function MinerSpawn(e)

	if ( e.self:GetSpawnPointID() == SPAWN_ID ) then
		
		if ( totalSpawns < LIMIT ) then
			totalSpawns = totalSpawns + 1;
		end
		
		local count = CountMiners();

		for i = 1, totalSpawns do
		
			if ( i + count > 99 ) then
				return;
			end
			
			eq.spawn2(MINER_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("miners", Event.spawn, MINER_TYPE, MinerSpawn);
end

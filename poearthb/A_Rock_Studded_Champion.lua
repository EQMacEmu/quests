local INVIS_MAN_ID = 369488;
local GALRONAR_TYPE = 222036;
local GALRONAR_SPAWNID = 369494;
local SPAWNIDS = { 369446, 369447, 369448, 369449 };

-- force them to respawn at same time
function event_spawn(e)
	for _, id in ipairs(SPAWNIDS) do
		eq.update_spawn_timer(id, 1000);
	end
	eq.depop_with_timer(GALRONAR_TYPE);
	eq.update_spawn_timer(INVIS_MAN_ID, 1000);
end

function event_death_complete(e)

	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222010) ) then -- A_Rock_Studded_Champion

		eq.update_spawn_timer(GALRONAR_SPAWNID, 1000);
		
		local variance = math.random(1, 1440);
		local t = (60 * 60 + variance) * 60; -- (60 hours/2.5 days * 60 minutes + variance) * 60 seconds
		eq.update_spawn_timer(SPAWNIDS[1], t*1000);
	end
end

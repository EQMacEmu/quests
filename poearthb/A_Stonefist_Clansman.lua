local INVIS_MAN_ID = 369487;
local BIRAK_TYPE = 222035;
local BIRAK_SPAWNID = 369493;
local SPAWNIDS = { 369442, 369443, 369444, 369445 };

-- force them to respawn at same time
function event_spawn(e)
	for _, id in ipairs(SPAWNIDS) do
		eq.update_spawn_timer(id, 1000);
	end
	eq.depop_with_timer(BIRAK_TYPE);
	eq.update_spawn_timer(INVIS_MAN_ID, 1000);
end

function event_death_complete(e)

	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222009) ) then -- A_Stonefist_Clansman

		eq.update_spawn_timer(BIRAK_SPAWNID, 1000);
		
		local variance = math.random(1, 1440);
		local t = (60 * 60 + variance) * 60; -- (60 hours/2.5 days * 60 minutes + variance) * 60 seconds
		eq.update_spawn_timer(SPAWNIDS[1], t*1000);
	end
end

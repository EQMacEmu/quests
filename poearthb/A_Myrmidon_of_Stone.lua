local INVIS_MAN_ID = 369489;
local AWISANO_TYPE = 222037;
local AWISANO_SPAWNID = 369492;
local SPAWNIDS = { 369438, 369439, 369440, 369441 };

-- force them to respawn at same time
function event_spawn(e)
	for _, id in ipairs(SPAWNIDS) do
		eq.update_spawn_timer(id, 1000);
	end
	eq.depop_with_timer(AWISANO_TYPE);
	eq.update_spawn_timer(INVIS_MAN_ID, 1000);
end

function event_death_complete(e)

	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222008) ) then -- A_Myrmidon_of_Stone

		eq.update_spawn_timer(AWISANO_SPAWNID, 1000);
		
		local variance = math.random(1, 1440);
		local t = (60 * 60 + variance) * 60; -- (60 hours/2.5 days * 60 minutes + variance) * 60 seconds
		eq.update_spawn_timer(SPAWNIDS[1], t*1000);
	end
end

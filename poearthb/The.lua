local INVIS_MEN_SPAWNIDS = { 369487, 369488, 369489 };
local GINTO_SPAWNID = 369491;

function event_signal(e)
	if ( e.signal == 1 ) then
		local elist = eq.get_entity_list();
		
		for _, id in ipairs(INVIS_MEN_SPAWNIDS) do
			if ( elist:GetSpawnByID(id):GetNPC().valid ) then
				return;
			end
		end
	end
	
	eq.update_spawn_timer(GINTO_SPAWNID, 1000);
end

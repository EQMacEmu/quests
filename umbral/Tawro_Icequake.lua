-- Spawns Spirit of Tawro when Tawro_Icequake dies.

function event_death_complete(e)
	eq.unique_spawn(176020,0,0,60,2899,352,128);
end
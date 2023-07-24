-- Spawns Spirit of Radir when Radir Fireshower dies.

function event_death_complete(e)
	eq.unique_spawn(176019,0,0,-2037,-765,-17,0);
end
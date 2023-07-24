function event_spawn(e)
	eq.signal(220020, 2); -- Lord_Mithaniel_Marr
end

function event_death_complete(e)
	eq.signal(220020, 1); -- Lord_Mithaniel_Marr
end

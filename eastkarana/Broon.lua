function event_death_complete(e)
	if(math.random(100) < 50) then
		brofath = 15138;
	else
		brofath = 15160;
	end
	eq.unique_spawn(brofath,7,0,807,2105,135,0);
end

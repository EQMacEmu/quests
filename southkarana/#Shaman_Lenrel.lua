function event_death_complete(e)
	if(math.random(100) < 50) then
		eq.unique_spawn(14124,0,0,2038,-4821,20,0); -- spawn High Shaman Phido
	else
		eq.unique_spawn(14124,0,0,2050,-1545,0,0); -- NPC: #High_Shaman_Phido
	end
end

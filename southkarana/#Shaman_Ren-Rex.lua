function event_death_complete(e)
	if(math.random(100) < 50) then
		eq.unique_spawn(14011,0,0,-2482,-7426,53,0); -- spawn High Shaman Grisok
	else
		eq.unique_spawn(14011,0,0,-258,-6483,3,0); -- NPC: #High_Shaman_Grisok
	end
end

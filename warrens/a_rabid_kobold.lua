function event_death_complete(e)
	local spawna = eq.unique_spawn(101006,0,0,-866,713,-33,260); -- NPC: a_kobold_master_blacksmith
	local spawnb = eq.unique_spawn(101006,0,0,-473,577,-74,200); -- NPC: a_kobold_master_blacksmith
	local spawnc = eq.unique_spawn(101006,0,0,-1019,506,-78,60); -- NPC: a_kobold_master_blacksmith
	
	if(math.random(100) < 5) then
		RandomSpawn = eq.ChooseRandom(spawna,spawnb,spawnc);
	end
end
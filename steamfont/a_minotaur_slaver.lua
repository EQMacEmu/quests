--NPC: a_minotaur_slaver   Zone: steamfont

function event_death_complete(e)
	ran = math.random(100);
	if(ran > 99) then
		eq.unique_spawn(56152,28,0,-1294,1360,-103); -- NPC: Minotaur_Hero
	end
end

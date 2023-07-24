function event_death_complete(e)
	-- MonkEpic 1.0
	e.self:Say("Foolish mortal! you think you have defeated me? Now, witness the true power of Rallos Zek!");
	-- Spawn: Xenevorash
	eq.spawn2(85208,0,0,-542,-807,79.12,0):AddToHateList(e.other,1);
end

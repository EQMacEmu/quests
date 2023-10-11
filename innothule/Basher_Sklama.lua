function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp.");
	elseif(e.message:findi("the captain")) then
		e.self:Say("You speak of da skeleton.  He belong to Kaglari.  He in dis swamp on little island.");
		eq.unique_spawn(52125,0,0,216,-1757,-19.8,131); -- NPC: #a_skeleton	
	end
end

-- END of FILE Zone:innothule  ID:228 -- Basher_Sklama 


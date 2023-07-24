function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp.");
	elseif(e.message:findi("captain")) then
		e.self:Say("You speak of da skeleton.  He belong to Kaglari.  He in dis swamp on little island."); -- should spawn a skeleton for urako quest
	end
end

-- END of FILE Zone:innothule  ID:228 -- Basher_Sklama 


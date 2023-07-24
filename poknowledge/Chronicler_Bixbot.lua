function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(27);
		e.self:Say("Welcome..Welcome! I am so excited to see a new face around New Tanaan. The Great Library of New Tanaan has a plethora of magnificent tomes to tantilize ones mind. I have here some books telling stories of gnomes that have shaped the history of our people. You may borrow them if you are literate in the Gnomish language. The books will return to me when you are finished with them via the enchantments placed upon them by New Tanaan.");
	end
end

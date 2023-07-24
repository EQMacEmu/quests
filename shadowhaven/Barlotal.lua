function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ye know what, " .. e.other:GetCleanName() .. ", I'm tired. Dern tired of trying to figure out this dern pottery wheel. Dey tell me dat I should be a good potta like me father but I can't even figure out what's right side up let alone make a pot!");
		e.self:DoAnim(28);
	end
end

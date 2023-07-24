function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks at you sternly and nods as he continues his watch.");
		e.self:DoAnim(48);
	end
end

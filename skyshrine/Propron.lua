function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm trying to study please stop bothering me.");
	end
end

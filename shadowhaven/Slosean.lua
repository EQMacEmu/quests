function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Have you seen my short ale?");
	end
end

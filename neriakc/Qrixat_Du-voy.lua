function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?");
	end
end


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("My life for the King of Above!");
	end
end

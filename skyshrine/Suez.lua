function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes? Can't you see we are busy here.");
	end
end

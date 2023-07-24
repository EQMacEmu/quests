function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I've seen your kind dashing about. Just watch your footing, you never know when you might slip and fall.");
	end
end

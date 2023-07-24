function event_say(e)
	if(e.message:findi("who.* ro")) then
		e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
	end
end
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler! By order of Sir Lucan, the toll fee is one gold piece a head.  Pay at once!");
	end
end

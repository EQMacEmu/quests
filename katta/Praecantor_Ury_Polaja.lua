function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhh! We must maintain our concentration and please stand back! We are dealing with creatures that could be very dangerous should we loose control over them!");
	end
end

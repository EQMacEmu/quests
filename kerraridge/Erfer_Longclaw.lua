function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Erfer not on duty.  Is Erfer's time off.  Please leave Erfer to buy his drinks.");
	end
end

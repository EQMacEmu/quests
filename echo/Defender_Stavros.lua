function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I had better not catch you trying to smuggle goods through Shadow Haven.  Everything must go through the trade commission.");
	end
end

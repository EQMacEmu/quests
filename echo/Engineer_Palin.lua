function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, can'a ye see I'm busy?  I need ta find a new direction ta start minin'.  Ever since we lost the lower tunnel to those damned bugs we've been fallin' behind.");
	end
end

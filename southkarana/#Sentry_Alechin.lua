function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, heed my warning.  Begone before nightfall.  There are evil beasts that lurk this land. Begone!");
	end
end


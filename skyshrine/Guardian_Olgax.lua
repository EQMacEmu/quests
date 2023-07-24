function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There are many places for the likes of you. Why don't you go find one right now and leave me alone.");
	end
end

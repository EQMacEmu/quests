function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Watch out in the water. Yelinak keeps a few small fish there.");
	end
end

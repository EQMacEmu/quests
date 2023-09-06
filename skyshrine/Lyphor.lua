function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please keep your voice down, " .. e.other:Race() .. ".  I cannot concentrate with you making all that racket.");
	end
end

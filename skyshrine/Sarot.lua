function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Leave me be.  I am trying to concentrate, " .. e.other:Race() .. ".");
	end
end

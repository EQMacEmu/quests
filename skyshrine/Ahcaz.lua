function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am preparing for my meeting. Please come back another time, " .. e.other:Race() .. ".");
	end
end

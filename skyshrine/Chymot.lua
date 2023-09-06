function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes, " .. e.other:Race() .. "?");
	end
end

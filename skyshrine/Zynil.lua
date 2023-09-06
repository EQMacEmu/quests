function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Could you perhaps go pester someone else, " .. e.other:Race() .. "?");
	end
end

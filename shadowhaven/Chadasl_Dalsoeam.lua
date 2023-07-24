function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you, " .. e.other:GetCleanName() .. "? Quite a view I have here, I sure hope tonight that she forgets to clo... er nothing, never mind.");
	end
end

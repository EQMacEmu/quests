function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. "! I hope you are enjoying your stay. There are many nice things in the stores here I sure hope you stay long enough to see them all!");
	end
end

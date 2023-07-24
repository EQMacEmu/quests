function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Be careful " .. e.other:GetCleanName() .. ".  The mines aren't safe since the underbulks broke through.");
	end
end

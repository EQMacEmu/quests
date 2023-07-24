function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Be careful beyond this point.  The poor degenerate souls that live in this area don't care much for outsiders.  Unless they bring some hope of a cure for their afflictions.");
	end
end

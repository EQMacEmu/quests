function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. ".  The protection of the Haven Defenders ends here at this door.  We won't be able to help you if you get into trouble in the deeper caverns.");
	end
end

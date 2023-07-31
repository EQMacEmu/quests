function event_say(e)
	if(e.message:findi("hail")) then -- only tested at indiff
		e.self:Say("Be careful down here, " .. e.other:GetCleanName() .. ".  We have seen some strange characters in the eastern tunnels. Some kind of cult members, I think.  Watch out.");
	end
end
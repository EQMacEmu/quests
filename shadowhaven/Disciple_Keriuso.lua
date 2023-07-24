function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to you, " .. e.other:GetCleanName() .. ".  If you are curious about our history or the magics that we study, feel free to ask around.  Most of the residents here are quite friendly.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then -- only tested at indiff
		e.self:Say("" .. e.other:GetCleanName() .. ", you do not belong here!  Those sharks are not very picky about what they eat.");
	end
end
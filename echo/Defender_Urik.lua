function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", watch yourself when wandering these caverns.  Many of the undesirables who were forced out of Shadow Haven have decided to set up residence here.");
	end
end

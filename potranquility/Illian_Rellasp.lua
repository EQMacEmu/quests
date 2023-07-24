function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ".  Come to enjoy the soothing serenity of this place?  The quiet waters remind me of the docks in Erudin when I was a child.  It is unfortunate that the tranquility of Quellious does not extend further into the world of Norrath.  Every Deepwater Knight yearns for the eternal calm of paradise after a life of faithful service to the gods.  Perhaps you have heard of one such knight that achieved transcendence.  His name was [Inte Akera] and he is one of the greatest Deepwater Knights to ever live.");
	end
end

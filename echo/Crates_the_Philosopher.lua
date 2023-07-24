function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ".  Have you come to discuss the merits of the Kingdoms of Above and Below?");
	elseif(e.message:findi("kingdom")) then
		e.self:Say("Have you not heard of our glorious kingdom?  Do you not realize that all the universe is ruled from these humble caverns?  If you need a history lesson you should talk to Amscray, though if you wish to discuss our philosophies than you have come to the right gnome.");
	end
end

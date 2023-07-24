function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hi there friend, I carry all kinds of ales and spirits that you may find to your liking.  A little word of advice though, when enjoying drinks in the Midst, try to not draw too much attention to yourself- many here think drinking is silly because it impairs ones ability to practice magic.");
		else
			e.self:Say("My apologies traveler but I am not permitted to trade with persons not registered with Shadowhaven. Please see Trade Commissioner Henry near the front gate for further details.");
		end
	end
end

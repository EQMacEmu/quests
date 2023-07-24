function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 6) then
		e.self:SetRunning(true);
	elseif(e.wp == 4 or e.wp == 7) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you, friend?  It is a good day to be alive in Antonica!  If you should happen to visit Surefall Glade, say hello to Hager Sureshot for me.");
	elseif(e.message:findi("hager")) then
		e.self:Say("Hager Sureshot is that know-nothing ranger in charge of the Protectors of the Pine. He thinks he can protect all of Surefall Glade. He is wrong.");
	elseif(e.message:findi("poach")) then
		e.self:Say("Excuse me! I am a HUNTER. A hunter of profit, not glory. Have you come to [collect the bounty] on my head? For your sake, the answer had better be [no].");
	elseif(e.message:findi("collect")) then
		e.self:Say("Then do your best, whelp! I need the practice. I hope for your sake that my gypsy friends are not nearby.");
	elseif(e.message:findi("no")) then
		e.self:Say("Too bad. I heard there is a new market for skins of your kind.");
	elseif(e.message:findi("surefall")) then
		e.self:Say("Surefall Glade is in the Jaggedpine Forest. Home to the druids and rangers. Home to some of the finest bearskins ever to walk the earth. I can hear the coins clinking already.");
	end
end
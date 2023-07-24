function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Luclin Survivalist Supplies. We carry the finest quality products for the adventurer or traveling merchant. May I interest you in a Phosphorescent Lantern?");
	end
end

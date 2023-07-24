function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sneers at you.  'You watch your step in these woods, broodling.  We troopers don't have time to protect all you broodlings from giants and goblins.");
	end
end
function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(49);
		e.self:Emote("gives a soft smile of warm greetings, 'Good day to you, traveler, and may the fates hold you in their highest favor. We are eternally grateful for what you are doing here -- in the planes, I mean. All of your efforts are so important -- more important, I believe, than you realize. Oh, I really should't be discussing this but... these are truly exciting times! To have all of Norrath's adventurers working toward a common goal! To have a greater enemy than your mortal neighbors and to unite against them. Aaah, how I envy you at times -- this newfound collective goal. Oh, forgive me, I ramble on where I should not. If you find yourself in need to replenish your supply stock, then perhaps my inventory would be of some interest to you? Please, search it at your leisure.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("swats at the mosquitoes flying around his head.  'Greetings!  The sea wall is no place for you.  Head back to the mainland.  You may find a party of adventurers to join up with and venture into the outlands.  I hear reports of [strange weapons] being found.  An adventurer could make quite a haul and you could help the outpost by decreasing the goblin population.'");
	elseif(e.message:findi("strange weapon")) then
		e.self:Say("I have seen and heard many tales of weapons of strange design.  I personally own a warhammer made by some other race, no doubt.  I found it in an ancient city hidden deep in a forest that was crawling with giant raptors!!  Many others in my unit found staffs, armor and blades, to say the least.  Alas, we were unable to find the city in later expeditions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
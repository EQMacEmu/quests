function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A fine day.  Quite murky and quiet, is it not?  May your path be filled with fortunes.  Be well.");
	elseif(e.message:findi("crystal")) then
		e.self:Say("Hrm?  A crystal of capturing?  Aye.  I do know the secret of their making.  Not that I would tell you.  I will, however, create one for you.  Provided you bring some of their components and a large coin reserve, that is. I require a potion of sorrow and 1000 gold coins.  A tidy sum, in return for which, I will do you the favor of not asking why you need such a... dark item.");
	elseif(e.message:findi("potion")) then
		e.self:Say("An interesting little concoction.  Gorth Bearsoul is the only alchemist I know of who can make such an item.  Loud and quite smelly, he is.  Not unusual for a barbarian.  He calls the icy city of Halas home.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7113, platinum = 100})) then --Potion of Sorrow
		e.self:Say("Excuse me while I add some other items to this mix. There. Finished. Here you go, and thank you for your business.");
		e.other:Faction(e.self,254,3); -- Faction: Gate Callers
		e.other:Faction(e.self,267,1); -- Faction: High Guard of Erudin
		e.other:Faction(e.self,266,1); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1); -- Faction: Heretics
		e.other:QuestReward(e.self,0,0,0,0,7112,1000); --Empty Crystal Sphere
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


---Needs Dialogue, Elroz
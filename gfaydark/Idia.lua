function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to - well. right now I have one that needs to go to Freeport.  Will you [deliver] mail to [Freeport] for me?");
	elseif(e.message:findi("mail") and not e.message:findi("deliver") and not e.message:findi("freeport") and not e.message:findi("qeynos")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers, adventurers, and [agents].  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("agents")) then
		e.self:Say("Lyra Lyrestringer, Tacar Tissleplay, Kilam Oresinger and Siltria Marwind all report to Jakum Webdancer.");
	elseif(e.message:findi("deliver") and e.message:findi("Freeport")) then
		e.self:Say("Take this letter to Felisity Starbright. You can find her at the bard guild hall. I'm sure she will compensate you for your trouble.");
		e.other:SummonCursorItem(18166); -- Item: A Pouch of Mail (Freeport)
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18167})) then
		e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		e.other:Faction(e.self,284,5); -- league of antonican bards
		e.other:Faction(e.self,281,1); -- knights of truth
		e.other:Faction(e.self,262,1); -- guards of qeynos
		e.other:Faction(e.self,304,-1); -- ring of scale
		e.other:Faction(e.self,285,-1); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,eq.ChooseRandom(6,7,8,9,10,11,12,13,14,15),0,0,1550);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark

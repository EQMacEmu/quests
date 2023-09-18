--Quest Name: Bard Mail Quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to Freeport and to Qeynos.  Will you deliver mail to [Freeport] or to [Qeynos] for me?");
	elseif(e.message:findi("freeport")) then
		e.self:Say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		e.other:SummonCursorItem(18164); -- Item: A Pouch of Mail (Freeport)
	elseif(e.message:findi("qeynos")) then
		e.self:Say("Take this pouch to Eve Marsinger in Qeynos. You can find her at the bard guild hall. I am sure she will compensate you for your troubles.");
		e.other:SummonCursorItem(18165); -- Item: A Pouch of Mail (Qeynos)
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18152}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18156})) then
		e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		e.other:Faction(e.self,284,5); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,math.random(8,12),0,0,1550);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

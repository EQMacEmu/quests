-- Duke Norfin's Delivery

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -100) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ". My guards seem to find you harmless enough, but I have yet to determine if you are trustworthy. We are always on the lookout for additional hands to assist in our work. Perhaps you are... sympathetic to our situation.");
		elseif(e.message:findi("situation")) then
			e.self:Say("Those blasted Houses in Shadow Haven. They think they have the right to own all trade going through the Haven. Well it's about time they learn that trade will continue with or without their consent. I know a few people on the Trade Commission who understand the way things really work and they don't care who does the trading as long as they get their cut.");
		elseif(e.message:findi("work")) then
			e.self:Say("Excellent! We like to keep changing who we use for deliveries. Keeps those dumb Defenders guessing and reduces the chances of goods not reaching their destination.");
		elseif(e.message:findi("destination")) then
			e.self:Say("I have an important shipment coming from Katta Castellum that's late. The courier who was picking up the shipment should still be there. I'd like for you to go over there and see what the hold up is. Take this note and show it to Jarin Lorean so he knows you're on official business. Report back to me with news. Better yet, return with the shipment if you can.");
			e.other:SummonCursorItem(19841); -- Item: Note to Jarin
		end
	else
		e.self:Say("You have a lot of nerve wandering in here. We'll be watching you carefully. Try anything and it will be the last thing you ever try.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 19840}, 0)) then
		e.self:Say("Excellent work. I'm glad you were able to collect this shipment. The buyers were getting anxious to have it delivered. Come back later and I may have another job for you.");
		e.other:Faction(e.self,1542,25); -- haven smugglers
		e.other:Faction(e.self,1559,2); -- lake recondite bandits
		e.other:Faction(e.self,1510,-12); -- house of fordel
		e.other:Faction(e.self,1511,-12); -- house of midst
		e.other:Faction(e.self,1512,-12); -- house of stout
		e.other:QuestReward(e.self,0,0,0,0,0,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

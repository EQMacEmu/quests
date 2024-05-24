function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a good thing to see new faces visiting our temple. We are the source of strength within this city. Do not be fooled by the Freeport Militia. They are not warriors of valor. [Join the fight against the Freeport Militia].");
	elseif(e.message:findi("join the fight")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("You are wise. If you are a paladin, either speak with Theron of this temple or visit the Hall of Truth here in North Freeport. Clerics should concetrate on keeping the knights strong and healthy. Would you care to [assist the Temple of Marr]?");
		else
			e.self:Say("The passion of the Queen of Love does not favor you. Begone from my sight!");
		end
	elseif(e.message:findi("assist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Good. Take this Potion of Marr to the Sentries of Passion. They are the protectors of this temple. Start in alphabetical order and the first shall take but a sip then you shall take it to the next in order of the alphabet. There are but eight sentries. Sentry Andlin to Sentry Xyrin. Go.");
			e.other:SummonCursorItem(12127); -- Item: Full Potion of Marr
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The path you walk is correct, but you have further to travel before you need worry about this.");
		else
			e.self:Say("The passion of the Queen of Love does not favor you. Begone from my sight!");
		end
	elseif(e.message:findi("heal")) then
		e.self:Say("It is not my duty to see to the wounded. You must seek out Plur Etinu. He is in here somewhere.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "The arangement was for three shark bones and 10 gold coins.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12126,item2 = 12126,item3 = 12126, gold = 10},1,text)) then
		e.self:Say("I thank you for your ten gold coins. Now we can pay the weekly oxygen tax imposed by the militia. Here is the shark powder.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,362,1,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,12125,100); -- Item: Shark Powder
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13983})) then
		e.self:Say("I see Tonmerk has found a use for my shark powder. We agreed to this trade when last we met. Unfortunately, I am out of it. If you desire the shark powder you will have to get me three shark bones. I wish you luck. Oh. I also require a payment of ten gold pieces. The taxes in Freeport are fierce.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,362,5); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,0,100);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12135})) then
		e.self:Say("The Sentries of Passion informed me of your journey to the Ocean of Tears and the demise of Sentry Xyrin. You performed beyond the call of duty. This is what makes an exceptional person. Take this for your great deed. The twin deities would wish it so.");
		e.other:Faction(e.self,362,5,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,15207,1000); -- Item: Spell: Divine Aura
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

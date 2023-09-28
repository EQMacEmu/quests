function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18740})) then -- A Tattered Note
		e.self:Say(string.format("Welcome to the Academy of Arcane Sciences. I am Lorme Tredore, Master Magician. Here is our guild robe, wear it with pride and represent us well, young %s. Now, let's get to work.",e.other:GetName()));
		e.other:Faction(e.self,220,100,0); -- Arcane Scientists
		e.other:Faction(e.self,281,25,0); -- Knights of Truth
		e.other:Faction(e.self,296,-15,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-15,0); -- The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,13559,20); -- Item: Used Violet Robe*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13951})) then -- Fleshy Orb
		e.self:Say("Ah. Thank you for bringing this to me! I will make very good use of it. Here take this small token of my appreciation in return. Guard Jenkins will no longer require it as he was killed on the training field yesterday. Tsk. tsk. tsk.");
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),0,eq.ChooseRandom(5350,5351,5352,5353,6350,6351,6352,7350,7351,7352),3000); -- random Fine Steel Weapons ; exp data confirmed
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Lorme_Tredore

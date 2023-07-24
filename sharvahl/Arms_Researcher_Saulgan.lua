function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and Well Met! If you are here to get a weapon of the Horde converted, let me see it. If not, please speak to Wygans. Don't worry, he may be tough as nails, but he won't bite you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7182})) then -- Claw of the Horde
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7183,400); -- Claw of Grimling Slaying
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7192})) then -- Dirk of the Horde
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7193,400); -- Dirk of Grimling Slaying
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7186})) then -- Great Sword of the Horde
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7187,400); -- Great Sword of Grimling Slaying
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7188})) then -- Hammer of the Horde
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7189,400); -- Hammer of Grimling Slaying
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7184})) then -- Short Sword of the Horde
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7185,400); -- Short Sword of Grimling Slaying
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7190})) then -- Staff of the Horde
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7191,400); -- Staff of Grimling Slaying
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

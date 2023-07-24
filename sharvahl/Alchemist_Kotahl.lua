function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and welcome! If you're here to have me convert a weapon of the High Grimling for you. please give it to me.  If not. please speak to Wygans.  He's in charge of dealing with the tourists this week.  I've got a lot of work to do.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7285})) then -- Claw of the High Grimling
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7286,500); -- Claw of the Grimling Slayer
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7295})) then -- Dirk of the High Grimling
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7296,500); -- Dirk of Grimling Slaying
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7289})) then -- Great Sword of the High Grimling
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7290,500); -- Great Sword of Grimling Slayer
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7291})) then -- Hammer of the High Grimling
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7292,500); -- Hammer of Grimling Slayer
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7287})) then -- Short Sword of the High Grimling
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7288,500); -- Short Sword of Grimling Slayer
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7293})) then -- Staff of the High Grimling
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7294,500); -- Staff of Grimling Slayer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

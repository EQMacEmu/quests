--Rysva_To-Biath.pl
--Book of Turmoil

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello.  Let me know if I can get you a drink.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18200})) then		
		e.self:Say("Take this note and be gone with you.");
		-- confirmed live factions
		e.other:Faction(e.self,370, 10);--Dreadguard Inner
		e.other:Faction(e.self,334, 1);--Dreadguard Outer
		e.other:Faction(e.self,236, 1);--Dark Bargainers
		e.other:QuestReward(e.self,0,0,0,0,18201);--a note (book of Turmoil, Text: TomeOfAges2)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13846,item2 = 18201})) then--Dark Elf Decapitated Head
		e.self:Say("Take this book and be gone with you.");
		-- confirmed live factions
		e.other:Faction(e.self,370, 10);--Dreadguard Inner
		e.other:Faction(e.self,334, 1);--Dreadguard Outer
		e.other:Faction(e.self,236, 1);--Dark Bargainers
		e.other:QuestReward(e.self,0,0,0,0,18202,72900); --Book of Turmoil
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19071,item2 = 19070,platinum = 1000})) then
		e.other:QuestReward(e.self,0,0,0,0,18302);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41042 -- Rysva_To`Biath
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

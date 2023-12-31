function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. "! I sell the finest quality ore imported from the mines of Norrath! It's difficult to keep enough ore available with the demands of the local smiths however and could use some [assistance] in restocking my supplies.");
	end
	if(e.message:findi("assistance")) then
		e.self:Say("Hooray! Fill this crate with either four small bricks of unrefined ore or four large Bricks of unrefined ore from Norrath and I will pay you for your assistance in keeping me in business.");
		e.other:SummonCursorItem(17814); -- Item: Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10953})) then
		e.self:Say("Thank you " .. e.other:GetCleanName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,1508, 4); -- Faction: Traders of the Haven
		e.other:Faction(e.self,1510, 1); -- Faction: House of Fordel
		e.other:Faction(e.self,1511, 1); -- Faction: House of Midst
		e.other:Faction(e.self,1512, 1); -- Faction: House of Stout
		e.other:QuestReward(e.self,0,0,0,44,0,5000);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10952})) then
		e.self:Say("Thank you " .. e.other:GetCleanName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(e.self,1508, 4); -- Faction: Traders of the Haven
		e.other:Faction(e.self,1510, 1); -- Faction: House of Fordel
		e.other:Faction(e.self,1511, 1); -- Faction: House of Midst
		e.other:Faction(e.self,1512, 1); -- Faction: House of Stout
		e.other:QuestReward(e.self,0,0,0,14,0,5000);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

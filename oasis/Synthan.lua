function event_trade(e)
	local item_lib = require("items");
	local gls = item_lib.count_handed_item(e.self, e.trade, {10400});
	local ls = item_lib.count_handed_item(e.self, e.trade, {10300});

	if(e.other:GetFactionValue(e.self) >= 0 and (ls > 0)) then -- Lightstone turn in, reward is either Runes and Research Volume I or II
		repeat
			e.self:Say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research'.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18175,18176),10000); -- Item(s): Runes and Research Volume I (18175), Runes and Research Volume II (18176)
			ls = ls - 1;
		until ls == 0
	end	

	if(e.other:GetFactionValue(e.self) >= 0 and (gls > 0)) then -- Greater Lightstone
		repeat
			e.self:Say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
			e.other:QuestReward(e.self,0,0,0,0,17504,10000); -- Item: Concordance of Research
			gls = gls - 1;
		until gls == 0
	end	

	item_lib.return_items(e.self, e.other, e.trade)
end

--this npc had no dialogue until 2015ish, but the quest was always there
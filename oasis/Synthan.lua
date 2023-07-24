function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10300})) then -- Lightstone turn in, reward is either Runes and Research Volume I or II
		e.self:Say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research'.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18175,18176),14500); -- Item(s): Runes and Research Volume I (18175), Runes and Research Volume II (18176)
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10400})) then -- Greater lightstone turn in, reward is Concordance of Research
		e.self:Say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
		e.other:QuestReward(e.self,0,0,0,0,17504,16000); -- Item: Concordance of Research
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


--this npc had no dialogue until 2015ish, but the quest was always there
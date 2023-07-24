-- Ink of the dark - enchanter epic lead in quest

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10626})) then
		e.self:Say("Crroooaak! Crrroooooaaakk!");
		e.other:QuestReward(e.self,0,0,0,0,10601);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: gukbottom ID: 66170 NPC: a_ghoul_scribe
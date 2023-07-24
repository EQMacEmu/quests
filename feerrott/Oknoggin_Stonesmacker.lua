function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yoo leave me 'lone!"); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20673})) then
		e.self:Emote("snatches the note from your hand and rips it open with his large hands. 'You take dis to Kargek. He want!'");
		e.other:QuestReward(e.self,0,0,0,0,20674,1000); -- Tiny Lute
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:feerrott  ID:47126 -- Oknoggin_Stonesmacker
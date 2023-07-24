-- Chef Chowderly's Award-Winning Recipes
-- created by Gonner
-- converted to lua by robregen

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("All these dirty dishes stinking up the place.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 55523})) then -- Note to Rellix
		e.self:Say("A note from Chef Chowderly, eh? I haven't heard from him in some time. Hope he is doing well.' Rellix reads the note. 'I do happen to have some spare dishes. Here, take them.");
		e.other:QuestReward(e.self,0,0,0,0,55524,5000); -- Case of Dishes
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone:rivervale ID:19117 -- Rellix.pl


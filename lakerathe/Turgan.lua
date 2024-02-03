-- Part of the quest for Boots of the Reliant

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail!  What brings you here?");
	elseif(e.message:findi("reliant")) then
		e.self:Say("Where did you hear... I don't know what you are talking about.  Begone!  Back to Kithicor with you!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18145})) then --Turgan's Note
		e.self:Say("I am that Turgan, but I am no longer worthy of this title.  Take this in hopes that you become a better steward than I was.");
		e.other:QuestReward(e.self,{itemid = 19002}); --Icon of the Reliant
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glowers at you dubiously as though wondering what it is your tombstone might say.");
	elseif(e.message:findi("marais")) then
		e.self:Emote("'s head snaps in your direction, 'Do you have my ring?  No?  Then quit your yammering!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29849}, 0)) then -- Promise Ring
		e.self:Say("Aye, this is it, did you kill her? Well anyway, here, I really didn't want this anymore- I was hoping some fool would give me something of value for it. Thanks.");
		e.other:QuestReward(e.self,0,0,0,0,29850); -- Rifkin's Diary - sealed
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

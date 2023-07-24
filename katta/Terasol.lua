-- Mining Operation

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you, " .. e.other:GetCleanName() .. ". I have usually the finest mining supplies one can find. However, I am waiting for a shipment so please check back later.");
	elseif(e.message:findi("take the mining pick")) then
		e.self:Say("Very well then. Here are the new mining picks. Send Daesorak my regards.");
		e.other:SummonCursorItem(4755); -- Item: A Bundle of Mining Picks
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4754}, 0)) then
		e.self:Say("Ah, of course, you must be sent to pick up the supplies that Daesorak has been needing for his mining operation. I was wondering when that crazy Dwarf was going to come and pick these up. I imagine then that you will [take the mining picks] to Daesorak?");
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Peace to you, " .. e.other:GetCleanName() .. ".  I see that you have come far along the path of tranquility and enlightenment.  Do you wish to test yourself further, and perhaps complete the path you started on so long ago?");
	elseif(e.message:findi("test")) then
		e.self:Say("Then, choose. Do you wish to be tested by Ton Po or Wu?");
	elseif(e.message:findi("wu")) then
		e.self:Say("Take this and read it.  Once you are finished, I will summon the Tranquil's most enlightened follower.");
		e.other:SummonCursorItem(18539); -- Strength
	elseif(e.message:findi("ton po")) then
		e.self:Say("Take this book and read about the legendary Ton Po.  When you are finished, hand it back, and I will summon the master for you.");
		e.other:SummonCursorItem(18538); -- Tranquility
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18539})) then --Strength
		e.self:Say("Farewell.");
		eq.spawn2(71097,0,0,660.0,1332.3,-766.9,189.9); -- NPC: Wu_the_Enlightened
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18538})) then --Tranquility
		e.self:Say("Farewell.");
		eq.spawn2(71096,0,0,660.0,1315.0,-766.9,189.9); -- NPC: Ton_Po
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
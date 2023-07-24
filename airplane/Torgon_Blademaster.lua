function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Are you a [true warrior]?");
	elseif(e.message:findi("true warrior")) then
		e.self:Say("Then you shall be tested as one. Choose. Do you wish to be tested by Falorn or Ogog?");
	elseif(e.message:findi("falorn")) then
		e.self:Say("So be it, warrior.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the mighty warrior Falorn to test you.");
		e.other:SummonCursorItem(18520); -- Falorn Story
	elseif(e.message:findi("ogog")) then
		e.self:Say("Ogog?  You are indeed brave for choosing that brute.  Take this book telling the tale of Ogog and read it.  When you are finished, hand it back to me.");
		e.other:SummonCursorItem(18521); -- Ogog Story
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18520})) then 	--Falorn Story
		e.self:Say("Falorn, come forth!");
		eq.spawn2(71067,0,0,563.3,1392.4,-766.9,63.4); -- NPC: Falorn
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18521})) then --Ogog Story
		e.self:Say("Farewell.");
		eq.spawn2(71064,0,0,563.3,1392.4,-766.9,63.4); -- NPC: Ogog
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end



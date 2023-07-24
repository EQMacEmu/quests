function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Do you believe that you are a [great Wizard]?");
	elseif(e.message:findi("great wizard")) then
		e.self:Say("I will not take your word for it! You must prove your greatness to my apprentices. Do you wish to be tested by Neasin or by Abec?");
	elseif(e.message:findi("Neasin")) then
		e.self:Say("Neasin it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the mighty wizard Neasin to test you.");
		e.other:SummonCursorItem(18530); -- Fire and Ice
	elseif(e.message:findi("Abec")) then
		e.self:Say("Abec it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the mighty wizard Abec to test you.");
		e.other:SummonCursorItem(18531); -- Knowledge and Power
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18530})) then --Fire and Ice
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71092,0,0,585,1304.3,-766.9,0.1); -- NPC: Neasin_Leornic
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18531})) then --Knowledge and Power
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71079,0,0,585,1304.3,-766.9,0.1); -- NPC: Abec_Ianor
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
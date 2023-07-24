function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Do you believe you are a great rogue?");
	elseif(e.message:findi("great rogue")) then
		e.self:Say("I will not take your word for it!  You must prove your greatness to one of my apprentices.  Do you wish to be tested by Rayne or by Kendrick?");
	elseif(e.message:findi("Rayne")) then
		e.self:Say("Rayne it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the mighty rogue Rayne to test you.");
		e.other:SummonCursorItem(18522); -- Tome of Shadows
	elseif(e.message:findi("Kendrick")) then
		e.self:Say("Kendrick it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the mighty rogue Kendrick to test you.");
		e.other:SummonCursorItem(18523); -- Silent Strider
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18522})) then 	--Tome of Shadows
		e.self:Say("Farewell.");
		eq.spawn2(71061,0,0,563.3,1372.6,-766.9,63.4); -- NPC: Rayne
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18523})) then --Silent Strider
		e.self:Say("Farewell.");
		eq.spawn2(71068,0,0,563.3,1372.6,-766.9,63.4); -- NPC: Kendrick
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
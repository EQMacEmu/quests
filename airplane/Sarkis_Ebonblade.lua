function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ".  Have you come here to test your dark powers of skill and spell casting?");
	elseif(e.message:findi("test")) then
		e.self:Say("You will be tested by either Gragrot or Tynicon.  Choose one!");
	elseif(e.message:findi("Gragrot")) then
		e.self:Say("Gragrot it is!  Take this book and read it.  When you are finished, hand it back to me and I shall summon Gragrot to test you.");
		e.other:SummonCursorItem(18524); -- Shadowy Virtues
	elseif(e.message:findi("Tynicon")) then
		e.self:Say("Tynicon it is!  Take this book and read it.  When you are finished, hand it back to me and I shall summon Tynicon to test you.");
		e.other:SummonCursorItem(18525); -- Knights of the Malign
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18524})) then --Shadowy Virtues
		e.self:Say("Farewell.");
		eq.spawn2(71063,0,0,563.3,1351.9,-766.9,63.4); -- NPC: Gragrot
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18525})) then --Knights of the Malign
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71098,0,0,563.3,1351.9,-766.9,63.4); -- NPC: Tynicon_DLin
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
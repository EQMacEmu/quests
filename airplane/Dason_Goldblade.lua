function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Are you pure of heart and soul?");
	elseif(e.message:findi("Heart and Soul")) then
		e.self:Say("Then choose. Do you wish your purity to be tested by Gregori or Dirkog?");
	elseif(e.message:findi("Gregori")) then
		e.self:Say("Gregori is a true and faithful warrior of Tunare.  Read this book and, when you feel confident, hand it back to me.  I will summon Gregori to test you after you have done so.");
		e.other:SummonCursorItem(18526); -- Virtuous Knight
	elseif(e.message:findi("Dirkog")) then
		e.self:Say("Dirkog is a gruff one, but his faith is what all paladins should strive to equal.  Read this book and return it to me.  After you have done so, I shall summon Dirkog to test you.");
		e.other:SummonCursorItem(18527); -- Walk with Evil
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18526})) then --Virtuous Knight
		e.self:Say("Farewell.");
		eq.spawn2(71089,0,0,563,1331.1,-766.9,63.4); -- NPC: Gregori_Lightbringer
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18527})) then --Walk with Evil
		e.self:Say("Farewell.");
		eq.spawn2(71077,0,0,563,1331.1,-766.9,63.4); -- NPC: Dirkog_Steelhand
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
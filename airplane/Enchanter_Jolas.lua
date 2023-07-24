function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Have you come here to test your powers of enchantment?");
	elseif(e.message:findi("test")) then
		e.self:Say("I am most honored to be able to help you. Please choose from one of my instructors. Lelulean or Enderbite.");
	elseif(e.message:findi("enderbite")) then
		e.self:Say("Enderbite it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon Enchantress Enderbite to test you.");
		e.other:SummonCursorItem(18535); -- Practical uses
	elseif(e.message:findi("lelulean")) then
		e.self:Say("Lelulean it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon Enchantress Lelulean to test you.");
		e.other:SummonCursorItem(18534); -- Tempt and Suggestion 
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18535})) then --Practical uses
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71085,0,0,640,1303.2,-766.9,0.4); -- NPC: Enderbite
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18534})) then --Tempt and Suggestion
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71104,0,0,640,1303.2,-766.9,0.4); -- NPC: Lelulean
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
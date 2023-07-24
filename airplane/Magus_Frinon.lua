function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Have you come here to test your abilities as a magician?");
	elseif(e.message:findi("test")) then
		e.self:Say("I am glad to hear that. Please choose from one of my instructors. Frederic or Roanis.");
	elseif(e.message:findi("Frederic")) then
		e.self:Say("Frederic it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the magician Frederic to test you.");
		e.other:SummonCursorItem(18532); -- Forms of magic
	elseif(e.message:findi("Roanis")) then
		e.self:Say("Roanis it shall be.  Take this book and read it.  When you are finished, hand it back to me and I shall summon the magician Roanis to test you.");
		e.other:SummonCursorItem(18533); -- Channeling
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18532})) then --Forms of magic
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71088,0,0,614.5,1304.1,-766.9,255); -- NPC: Frederic_Calermin
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18533})) then --Channeling
		e.self:Say("Till next time!  Farewell!");
		eq.spawn2(71094,0,0,614.5,1304.1,-766.9,255); -- NPC: Roanis_Elindar
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
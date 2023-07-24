-- Necromancer Epic NPC -- Drakis_Bloodcaster
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:Race() .. ". Are you ready to begin?");
	elseif(e.message:findi("ready")) then
		e.self:Say("Then choose, necromancer. Do you wish to be tested by Dugaas or Jzil?");
	elseif(e.message:findi("jzil")) then
		e.self:Say("Take this tome and read it.  When you are finished, return it to me and I will summon Jzil.");
		e.other:SummonCursorItem(18536); -- Shadowy Thoughts
	elseif(e.message:findi("Dugaas")) then
		e.self:Say("Take this book and read it then.  When you are finished, hand it back to me and I will summon the vile Dugaas.");
		e.other:SummonCursorItem(18537); -- Pomp and Circumstance
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18536})) then --Shadowy Thoughts
		e.self:Say("Farewell.");
		eq.spawn2(71074,0,0,654.9,1305,-762.2,22); -- NPC: Jzil_GSix
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18537})) then --Pomp and Circumstance
		e.self:Say("Farewell.");
		eq.spawn2(71084,0,0,661.6,1305,-762.2,22); -- NPC: Dugaas_Helpyre
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
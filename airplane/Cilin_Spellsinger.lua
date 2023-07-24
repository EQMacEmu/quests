function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ".  Do you feel that you are ready to be tested in song?");
	elseif(e.message:findi("tested")) then
		e.self:Say("The test of songs holds both joy and sorrow. Choose who you wish to begin with, Denise or Clarisa");
	elseif(e.message:findi("clarisa")) then
		e.self:Say("Then Clarisa it shall be. Simply read the contents of this journal and return it to me when you are ready for your test. If you decide that perhaps Clarisa is not who you wish to test you, simply destroy the book and come back to me when you are ready.");
		e.other:SummonCursorItem(18542); -- The Flute
	elseif(e.message:findi("denise")) then
		e.self:Say("Then Denise it shall be. You will want to peruse the contents of this journal before your test. When you are ready, simply hand it back to me and I will call Denise forth. If you decide that perhaps Denise is not who you want to test you, then destroy the book and see me again when you are ready.");
		e.other:SummonCursorItem(18543); -- Dark Song
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18542})) then --Strength
		e.self:Say("Farewell.");
		eq.spawn2(71081,0,0,660.7,1388.9,-766.9,192.6); -- NPC: Clarisa_Spiritsong
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18543})) then --Tranquility
		e.self:Say("Farewell.");
		eq.spawn2(71082,0,0,660.7,1368.4,-766.9,192.6); -- NPC: Denise_Songweaver
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
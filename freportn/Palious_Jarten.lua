function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to see you, " .. e.other:GetCleanName() .. "!! Do not forget that the clerics of Mithaniel Marr are here to help those who pay tribute to Him. Should you require me to [cure disease], just mention it.");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("If you require me to cure disease, it will cost you 10 gold coins.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {gold = 10})) then
		e.self:Say("May the valor of Mithaniel Marr burn brightly in our soul!");
		e.self:CastSpell(213,e.other:GetID()); -- Spell: Cure Disease
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

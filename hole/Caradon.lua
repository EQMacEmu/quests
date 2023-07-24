-- Part of SK Epic 1.0
function event_say(e)
	if(e.other:GetFactionValue(e.self) > -83) then
		if(e.message:findi("Hail")) then
			e.self:Say("Please help me get out of here! My companion, Kyrenna, and I are trapped in this hellish place!");
		elseif(e.message:findi("Who is Kyrenna")) then
			e.self:Say("I was with Kyrenna when she attempted to revive the corpse of Glohnor the Valiant. Like fools, we rushed into a trap. Now we sit here and await our deaths.");
		elseif(e.message:findi("Where is Kyrenna")) then
			e.self:Say("She is close by. For a price, I shall tell you. Bring me the key to my freedom and I will betray her, who sentenced me to this fate.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) > -83 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14373},0)) then
		e.self:Say("Kyrenna! We are free!");
		eq.spawn2(39155, 0, 0, -195.8, 426.6, -213.9, 115):AddToHateList(e.other,1);
		e.other:Faction(e.self,404, 3); -- Faction: True Spirit
		eq.attack(e.other:GetName());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

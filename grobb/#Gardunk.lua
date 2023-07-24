-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18845})) then -- A tattered note
		e.self:Say("You fight like alligator and tear enemy limb from limb!  Wear tunic that smell of swamp an devour enemy wit brodder Dark Ones!  You go see Gargh now, he got work for you!");
		e.other:Faction(e.self,237,15,0);	-- Dark Ones
		e.other:Faction(e.self,308,3,0);	-- Shadowknights of Night Keep
		e.other:Faction(e.self,251,-2,0); -- Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,13576,20);	-- Molding Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

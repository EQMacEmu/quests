--Shaman Skull Quest 6
function event_death_complete(e)
	e.self:Shout("the river of Xinth...");
end

function event_trade(e)
	local item_lib = require("items");
	--Turn in the a potion of swirling liquid
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12752})) then
		e.other:QuestReward(e.self,0,0,0,0,12750);--give the player one of the Iksar skulls of the sisters...
		e.self:Shout("Go to where the pines have been smashed. Must reach great heights!");
		eq.depop_with_timer();
		-- an npc named Vagnar the Channeler is supposed to spawn and shout that text while running away
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

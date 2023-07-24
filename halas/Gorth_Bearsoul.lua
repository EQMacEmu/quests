function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. yerself.  I'm sure ye've better things to do than to bother a man makin' his potions. then. eh?");
	elseif(e.message:findi("sorrow")) then
		e.self:Say("Ach! What ye be needin that fer? Only those of dark magic require such a thing and by my mother, never could I sell to such a soul. If yer soul be clean then put yer [money] in this enchanted pouch and I will know your intent. If yer soul be rotten I'll be known and you'll be dead. Indifferent I better be to your actions.");
	elseif(e.message:findi("money")) then
		e.self:Say("Suren ye didnae think I'd give ye a potion fer free? I'm needn 500 gold coins to make such an item. Hard to make and few are the uses fer such a potion.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {platinum = 50})) then
		e.self:Say("Here ye are.");
		e.other:QuestReward(e.self,0,0,0,0,7113,50); --Potion of Sorrow
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Dialogue is wrong and some missing, someone manually typed that on allakhazams - Elroz
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

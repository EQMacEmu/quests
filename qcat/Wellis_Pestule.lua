function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You do not yet bear the sweet aroma of death and decay that the Plague Bringer bestows upon his most faithful servants. What is it that you seek from Wellis?");
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To assemble scourge knight gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Wolf Pelt and two Decaying Finger Bones in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19633); -- Item: Crude Gauntlets Mold
	elseif(e.message:findi("boot")) then
		e.self:Say("To assemble scourge knight boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Wolf Pelts, and two Decaying Foot Bones in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19634); -- Item: Crude Boot Mold
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a scourge knight bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Wolf Pelt and a Decaying Ulna Bone in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19632); -- Item: Crude Bracer Mold
	elseif(e.message:findi("helm")) then
		e.self:Say("To assemble a scourge knight helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Wolf Pelt and a Decaying Skull in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19631); -- Item: Crude Helm Mold
	elseif(e.message:findi("greave")) then
		e.self:Say("To assemble scourge knight greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Wolf Pelts and two Decaying Tibia in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19636); -- Item: Crude Greaves Mold
	elseif(e.message:findi("vambrace")) then
		e.self:Say("To assemble scourge knight vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Wolf Pelt and two Decaying Humerus Bones in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19635); -- Item: Crude Vambrace Mold
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To assemble a scourge knight breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Wolf Pelt, a Decaying Sternum, and a Decaying Ribcage in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19637); -- Item: Crude Breastplate Mold
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20206})) then
		e.self:Say("Welcome to the Bloodsabers young Scourge Knight. I will help prepare you for your spreading of the disease. You must use this Mail Assembly Kit to construct the pieces of your armor. Each piece will require different materials for its construction. Will you craft [Gauntlets of the Scourge Knight], [Boots of the Scourge Knight], a [Bracer of the Scourge Knight], a [Helm of the Scourge Knight], [Greaves of the Scourge Knight], [Vambraces of the Scourge Knight], or a [Breastplate of the Scourge Knight]?");
		e.other:QuestReward(e.self,0,0,0,0,17124);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20188, item2 = 19946})) then
		e.self:Emote("Wellis Pestule fashions a grip out of the giant king snake skin, sharpens the edge of the blade to be razor sharp, and polishes the weapon with a strange blood like substance.");
		e.self:Say("A fine weapon for a Knight of the Bloodsabers. Go now and spread the Disease!");
		e.other:QuestReward(e.self,0,0,0,0,20260);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
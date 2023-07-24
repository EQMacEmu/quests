-- Bertoxxulous cleric quest armor

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The dead are watching you young one, yet you are safe under their otherworldly gaze. Is there something I can do for you?");
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To assemble pestilence priest gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Large King Snake Skin and two Gnoll Finger Bones in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19633); -- Item: Crude Gauntlets Mold
	elseif(e.message:findi("boot")) then
		e.self:Say("To assemble pestilence priest boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Large King Snake Skins, and two Gnoll Foot Bones in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19634); -- Item: Crude Boot Mold
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a pestilence priest bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Large King Snake Skin and a Gnoll Ulna Bone in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19632); -- Item: Crude Bracer Mold
	elseif(e.message:findi("helm")) then
		e.self:Say("To assemble a pestilence priest helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Large King Snake Skin and a Gnoll Skull in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19631); -- Item: Crude Helm Mold
	elseif(e.message:findi("greaves")) then
		e.self:Say("To assemble pestilence priest greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Giant King Snake Skins and two Gnoll Tibia in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19636); -- Item: Crude Greaves Mold
	elseif(e.message:findi("vambrace")) then
		e.self:Say("To assemble pestilence priest vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Giant King Snake Skin and two Gnoll Humerus Bones in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19635); -- Item: Crude Vambrace Mold
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To assemble a pestilence priest breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Giant King Snake Skin, a Gnoll Sternum, and a Gnoll Ribcage in the Mail Assembly Kit.");
		e.other:SummonCursorItem(19637); -- Item: Crude Breastplate Mold
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20207})) then
		e.self:Say("Well met young disciple of Bertoxxulous. Perhaps one day you shall serve the Plague Lord in his realm, but for now you will serve the Bloodsabers, his mortal agents on Norrath. The armor you seek must be assembled using this Mail Assembly Kit. The materials necessary to construct the armor vary depending on the piece being crafted. Do you wish to craft [Gauntlets] of the Pestilence Priests, [Boots] of the Pestilence Priests, a [Bracer] of the Pestilence Priests, a [Helm] of the Pestilence Priests, [Greaves] of the Pestilence Priests, [Vambraces] of the Pestilence Priests, or a [Breastplate] of the Pestilence Priests?");
		e.other:QuestReward(e.self,0,0,0,0,17124);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20199, item2 = 19946})) then
		e.self:Emote("fashions a grip from the giant king snake skin and polishes the mace with a strange dark substance. 'Wield it with pride young priest, may you spread the disease!");
		e.other:Faction(e.self,221,5); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,-1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,20261,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

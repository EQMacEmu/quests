function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("So you are the next pathetic maggot I have the displeasure of training to be a useful Shadowknight of the Lodge of the Dead. First you must get yourself outfitted in a suit of [armor]. those rags you wear can not even contain the stench of your miserable hide and will do no good protecting it from the edge of an enemy's blade.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Seek Krivn S'Tai in the Commoner quarter of Neriak and give him this request parchment. Krivn S'Tai has been paid in advance by the Lodge of the Dead for the requested service. Simply give him the request parchment and he will instruct you further. When you have outfitted yourself in a suit of armor return to the Lodge of the Dead and I will grant you [another task].");
		e.other:SummonCursorItem(19584); -- Item: Request Parchment
	elseif(e.message:findi("task")) then
		e.self:Say("Ah. you are eager to advance further within the Lodge of the Dead. Although it is my duty to aid your training. do not allow your arrogance to blind you to your lowly position amongst the Queens most loyal subjects. Your next task is to assist the construction of a [weapon] and [shield] worthy of being wielded by a Shadowknight of the Lodge of the Dead.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Beyond the mouth of Neriak lies the Nektulos Forest. There the walking dead can be found digging their way from the ashen soil of the [Ultricle]. their flesh cured and hardened and bones strengthened from the minerals and volcanic ash in which they rested in death. Return some of these undead to the rest they have abandoned and bring to me some Leathered Zombie Flesh, a Petrified Humerus bone, and a Petrified Rib bone.");
	elseif(e.message:findi("shield")) then
		e.self:Say("The bones of the dead that dig from their graves at the [Ultricle] in the Nektulos Forest have been strengthened by the minerals and ashen soil. Return some of these walking dead to the rest they have abandoned and bring to me four Petrified Femurs.");
	elseif(e.message:findi("Ultricle")) then
		e.self:Say("In the Nektulos Forest near the pass to the Lavastorm Mountains is a gray region barren of life whose boundaries are marked by carved stones displaying runes the color of freshly spilt blood. The area the runed stones mark is called the Ultricle. It is where the weak. dead. and dying Teir'Dal that have not earned a noble burial are left to rot and one day if they are lucky join the ranks of the Undead.");
	elseif(e.message:findi("forge")) then
		e.self:Say("There is a forge near the Blue Flame Armory in the Neriak Commons and in the Ogre section of the Foreign Quarter. Sharpening stones can be purchased from vendors who deal in blacksmithing supplies.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19574,item2 = 16197,item3 = 19554})) then
		e.self:Say("Well, you're not completely useless, afterall. Take this sword and sharpen it. Then, return it to me.");
		e.other:QuestReward(e.self,0,0,0,0,19572);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19573})) then
		e.self:Say("I'm surprised, I really am. I didn't think somebody like you could pull it off. Here, take this before I change my mind.");
		e.other:Faction(e.self,239,15); --The Dead
		e.other:Faction(e.self,303,2); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-2); --King Naythox Thex
		e.other:Faction(e.self,275,-2); --Keepers of Art
		e.other:Faction(e.self,245,-2); --Eldritch Collective
		e.other:Faction(e.self,1522,-30); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,19607,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19570,item2 = 19570,item3 = 19570,item4 = 19570})) then
		e.self:Emote("fashions the petrified femurs into a shield frame. This will be the frame of your new shield. Return now again to the Nektulos Forest, in the gray ashen region of the forest near the Lavastorm mountains the basilisks often come down from the fiery peaks to lay their eggs in the ashen soil. Basilisk hatchlings can be found there as they make their way towards the warmer interior of the mountains. Hunt these basilisk hatchlings and gather two Basilisk Hatchling Skins. Once this is done take the skins and frame to Medron Y'Lask at the Furrier Royale.");
		e.other:Faction(e.self,239,15); --The Dead
		e.other:Faction(e.self,303,2); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-2); --King Naythox Thex
		e.other:Faction(e.self,275,-2); --Keepers of Art
		e.other:Faction(e.self,245,-2); --Eldritch Collective
		e.other:Faction(e.self,1522,-30); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,19571,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:neriakc  ID:42067 -- Ulraz_S`Lon


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

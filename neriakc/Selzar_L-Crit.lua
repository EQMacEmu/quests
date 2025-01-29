--Selzar L'Crit, Neriakc 42085

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What have we here? Another hopeful member of the House of the Ebon Mask? You've got much to learn before you will be of much use to our House or the secret operations that support both the thrones of our King and Queen. First you need to outfit yourself in a suit of [armor], " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("armor")) then
		e.self:Say("Seek Kanthu M'Rekkor and give him this request parchment. When you have outfitted yourself in a suit of armor return to the House of the Ebon Mask and I will grant you [another task].");
		e.other:SummonCursorItem(2416); -- Item: Note to Kanthuk
	elseif(e.message:findi("other task")) then
		e.self:Say("Ah, you are eager to advance further within the House of the Ebon Mask. Although it is my duty to aid your training, do not allow your arrogance to blind you to your lowly position in our House. I can see that you have not yet learned to temper the use of your tongue. Your next task is to assist the construction of a [weapon] and [bow] worthy of being wielded by a Rogue of the House of the Ebon Mask.");
	elseif(e.message:findi("bow")) then
		e.self:Say("The Halfling Druids from Rivervale that frequent the ancient druid ruins in the Nektulos Forest are guarded by Leatherfoot Warriors. The peck druids perform the rituals that they hope will prevent Innoruuks corruption from spreading deeper into the Forest and the lands beyond. Should you slay the peck warriors guarding the druids and obtain a Leatherfoot Short Bow, take the bow, a Black Mamba Skin, and a Lock of Zombie Hair to Andara C'Luzz at The Bleek Fletcher in the Neriak Commons near the headquarters of the Indigo Brotherhood.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Beyond the mouth of Neriak lies the Nektulos Forest. There the Halflings of Rivervale have set up camps at ancient druid holy sites in an attempt to cleanse Innoruuks corruption that is spreading through the Nektulos Forest. Slay these trespassers and bring me a Large Snake Skin, a Halfling Fibula bone, and a Halfling Clavicle bone.");
	elseif(e.message:findi("forge")) then
		e.self:Say("There is a forge near the Blue Flame Armory in the Neriak Commons and in the Ogre section of the Foreign Quarter. Sharpening stones can be purchased from vendors who deal in blacksmithing supplies.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19578, item2 = 19577, item3 = 13060})) then
		e.self:Say("You have slain enemies of our order. Carry your weapon with pride.");
		e.other:QuestReward(e.self,0,0,0,0,19608,150);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

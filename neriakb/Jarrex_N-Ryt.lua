--Jarrex N-Ryt.pl
--Orc Slayer Armor/Orc Slayer Weapon/Orc Slayer Shield


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What have we here? A new weakling that wishes to reap some sort of self-value and renown through service to the Indigo Brotherhood perhaps? Well speak up whelp!! Have you come to [destroy the enemies of Neriak] or are you a coward better suited to mop the filth from the back rooms of the Maidens Fancy.");
	elseif(e.message:findi("destroy the enemies")) then
		e.self:Say("If you are going to be of any value to the Indigo Brotherhood you will need to outfit yourself in a suit of armor that will turn aside the blades of enemy forces. From the looks of you even the tiny fangs of a moss snake could bring you death. Take this request form to Issva H'Rugla to get yourself started on the assembly of your armor. When you have procured some protection for your weakling body return to me for [further instruction].");
		e.other:SummonCursorItem(31753);--Request Form
	elseif(e.message:findi("further instruction")) then
		e.self:Say("Ah, you are eager to advance further within the Indigo Brotherhood. Although it is my duty to aid your training, do not allow your arrogance to blind you to your lowly position amongst the Kings most loyal subjects. Your next task is to assist the construction of a [weapon] and [shield] worthy of being wielded by a Warrior of the Indigo Brotherhood.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Beyond the mouth of Neriak lies the Nektulos Forest. There the Deathfist Clan of Orcs has set up camps in an attempt to invade and claim the Nektulos Forest. Slay these invaders and bring to me an Orc Templar Scalp, an Orc Fibula bone, and an Orc Clavicle bone.");
	elseif(e.message:findi("shield")) then
		e.self:Say("Young Kodiak Bears often wander into the Nektulos Forest from the Commonlands searching for food. You do not appear to have the strength to arm wrestle a pixie. If you prove me wrong by slaying Young Kodiaks and bringing me four Young Kodiak Femurs I will guide you in the construction of a shield worthy of a warrior of the Indigo Brotherhood.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require an Orc Clavicle, an Orc Fibula, and a Deathfist Templar Scalp.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16173, item2 = 19565, item3 = 19564},1,text)) then--Deathfist Templar Scalp, Orc Clavicle, Orc Fibula
		e.self:Emote("fashions the orc templar scalp, orc fibula, and orc clavicle into the likeness of a sword hilt. 'This will be the hilt of your new sword. Take this jagged blade and sharpen it in a [forge] using a [sharpening stone], it may take you several attempts if you are unfamiliar with the process. Once you have sharpened the blade take the hilt and the sharpened blade to Opal H'Rugla at the Blue Flame.");
		e.other:QuestReward(e.self,0,0,0,0,19606);--Jagged Orc Slayer Sword
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19562, item2 = 19562, item3 = 19562, item4 = 19562})) then--Young Kodiak Femurs
		e.self:Say("So you have more strength than you seem to.  Hmm...here is your shield, " .. e.other:GetCleanName() .. ".");--text made up
		e.other:QuestReward(e.self,0,0,0,0,19609);--Black Femur Shield
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

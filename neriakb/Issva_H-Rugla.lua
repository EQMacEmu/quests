--Issva_H-Rugla.pl
--Orc Slayer Armor

function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("Hail")) then
			e.self:Say("If you're looking for chit chat you can bugger off. I'm here to sell supplies not company.");
		elseif(e.message:findi("materials")) then
			e.self:Say("Many species of dangerous creatures, the walking dead, and invading Deathfist Orcs inhabit the Nektulos Forest. You must defeat these creatures and undead in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gauntlets], [boots], a [bracer], a [helm], [greaves], [vambraces], or a [breastplate]?");
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("To craft Orc Slayer Gauntlets you require two [silk thread], a cracked pyre beetle carapace, and two orc finger bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
			e.other:SummonCursorItem(19559);--Tattered Glove Pattern
		elseif(e.message:findi("boot")) then
			e.self:Say("To craft Orc Slayer Boots you require two [silk thread], two cracked pyre beetle carapaces, and two orc foot bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
			e.other:SummonCursorItem(19561);--Tattered Boot Pattern
		elseif(e.message:findi("bracer")) then
			e.self:Say("To craft an Orc Slayer Bracer you require a [silk thread], a cracked pyre beetle carapace, and an orc ulna bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern.");
			e.other:SummonCursorItem(19558);--Tattered Wristband Pattern
		elseif(e.message:findi("helm")) then
			e.self:Say("To craft an Orc Slayer Helm you require two [silk thread], a cracked pyre beetle carapace, and an orc skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
			e.other:SummonCursorItem(19555);--Tattered Cap Pattern
		elseif(e.message:findi("greave")) then
			e.self:Say("To craft Orc Slayer Greaves you require three [silk thread], a pyre beetle carapace, two orc tibia, and an orc pelvis bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
			e.other:SummonCursorItem(19560);--Tattered Pant Pattern
		elseif(e.message:findi("vambrace")) then
			e.self:Say("To craft Ord Slayer Vambraces you require two [silk thread], a pyre beetle carapace, and two orc humerus bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
			e.other:SummonCursorItem(19557);--Tattered Sleeve Pattern
		elseif(e.message:findi("breastplate")) then
			e.self:Say("To craft an Orc Slayer Breastplate you require four [silk thread], a pristine pyre beetle carapace, an orc sternum, and an orc ribcage. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
			e.other:SummonCursorItem(19556);--Tattered Tunic Pattern
		end
	else
		if(e.message:findi("Hail")) then
			e.self:Say("If you're looking for chit chat you can bugger off. I'm here to sell supplies not company.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31753})) then --Request Form
		e.self:Say("So you are one of Jarrex's new recruits. You are to assist in the construction of the armor you will don as a new Warrior of the Indigo Brotherhood. I have assembled a kit that is used in the crafting of Orc Slayer Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
		e.other:QuestReward(e.self,0,0,0,0,17124); --Mail Assembly Kit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41064 -- Issva_H`Rugla
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

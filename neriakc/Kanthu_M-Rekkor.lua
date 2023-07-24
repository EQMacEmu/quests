--Kanthu M'Rekkor, Neriakc 42075
--Status: COMPLETE

function event_say(e)
	if(e.message:findi("material")) then
		e.self:Say("Many species of dangerous creatures, the restless dead, and halfling invaders from Rivervale inhabit the Nektulos Forest. You must defeat these creatures and halflings in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gloves], [boots], a [bracer], a [coif], [leggings], [sleeves], or a [tunic]?");
	elseif(e.message:findi("silk thread")) then
		e.self:Say("Silk thread is sewn by a tailor using a [sewing kit] or a community [loom]. Two spiderling silks combined in the [sewing kit] or community [loom] will create one silk thread.");
	elseif(e.message:findi("boot")) then
		e.self:Say("To craft Ashen Bone Mail Boots you require two [silk thread], two ruined ash drakeling scales, and two halfling foot bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		e.other:SummonCursorItem(19561); -- Item: Tattered Boot Pattern
	elseif(e.message:findi("bracer")) then
		e.self:Say("To craft an Ashen Bone Mail Bracer you require a [silk thread], a ruined ash drakeling scales, and a halfling ulna bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern.");
		e.other:SummonCursorItem(19558); -- Item: Tattered Wristband Pattern
	elseif(e.message:findi("coif")) then
		e.self:Say("To craft a Ashen Bone Mail Coif you require two [silk thread], a ruined ash drakeling scales, and a halfling skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
		e.other:SummonCursorItem(19555); -- Item: Tattered Cap Pattern
	elseif(e.message:findi("glove")) then
		e.self:Say("To craft Ashen Bone Mail Gloves you require two [silk thread], a ruined ash drakeling scales, and two halfling finger bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		e.other:SummonCursorItem(19559); -- Item: Tattered Glove Pattern
	elseif(e.message:findi("legging")) then
		e.self:Say("To craft Ashen Bone Mail Leggings you require three [silk thread], ash drakeling scales, two halfling tibia, and a halfling pelvis bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
		e.other:SummonCursorItem(19560); -- Item: Tattered Pant Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To craft Ashen Bone Mail Sleeves you require two [silk thread], ash drakeling scales, and two halfling humerus bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		e.other:SummonCursorItem(19557); -- Item: Tattered Sleeve Pattern
	elseif(e.message:findi("tunic")) then
		e.self:Say("To craft an Ashen Bone Mail Tunic you require four [silk thread], pristine ash drakeling scales, a halfling sternum, and a halfling ribcage. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		e.other:SummonCursorItem(19556); -- Item: Tattered Tunic Pattern
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2416})) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
		e.other:QuestReward(e.self,0,0,0,0,17124);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

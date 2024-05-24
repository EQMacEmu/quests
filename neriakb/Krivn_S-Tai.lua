function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("materials")) then
			e.self:Say("Many species of dangerous creatures and even the walking remains of the dead inhabit the Nektulos Forest. You must defeat these creatures and undead in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gloves], [boots], a [bracer], a [coif], [leggings], [sleeves], or a [tunic]?");
		elseif(e.message:findi("boot")) then
			e.self:Say("To craft Bone Mail Boots you require two [silk thread], two ruined wolf pelts, and two calcified foot bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Boot Pattern.");
			e.other:SummonCursorItem(19561); -- Item: Tattered Boot Pattern
		elseif(e.message:findi("bracer")) then
			e.self:Say("To craft a Bone Mail Bracer you require a [silk thread], a ruined wolf pelt, and a calcified ulna bone. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Bracer Pattern.");
			e.other:SummonCursorItem(19558); -- Item: Tattered Wristband Pattern
		elseif(e.message:findi("coif")) then
			e.self:Say("To craft a Bone Mail Coif you require two [silk thread], a ruined wolf pelt, and a calcified skull. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Cap Pattern.");
			e.other:SummonCursorItem(19555); -- Item: Tattered Cap Pattern
		elseif(e.message:findi("glove")) then
			e.self:Say("To craft Bone Mail Gloves you require two [silk thread], a ruined wolf pelt, and two calcified finger bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Glove Pattern.");
			e.other:SummonCursorItem(19559); -- Item: Tattered Glove Pattern
		elseif(e.message:findi("legging")) then
			e.self:Say("To craft Bone Mail Leggings you require three [silk thread], a low quality wolf pelt, two calcified tibia, and a calcified pelvis. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Leggings Pattern.");
			e.other:SummonCursorItem(19560); -- Item: Tattered Pant Pattern
		elseif(e.message:findi("sleeve")) then
			e.self:Say("To craft Bone Mail Sleeves you require two [silk thread], a low quality wolf pelt, and two calcified humerus bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Sleeves Pattern.");
			e.other:SummonCursorItem(19557); -- Item: Tattered Sleeve Pattern
		elseif(e.message:findi("tunic")) then
			e.self:Say("To craft a Bone Mail Tunic you require four [silk thread], a medium quality wolf skin, a calcified sternum, and a calcified ribcage. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Tunic Pattern.");
			e.other:SummonCursorItem(19556); -- Item: Tattered Tunic Pattern
		elseif(e.message:findi("silk thread")) then
			e.self:Say("Silk Thread is sewn by a tailor using a [sewing kit] or a community [loom]. Two spiderling silks combined in the sewing kit or loom will create one silk thread.");
		elseif((e.message:findi("sewing kit")) or (e.message:findi("loom"))) then
			e.self:Say("A sewing kit may be purchased at the Furrier Royale in Neriaks Third Quarter or at the Silk Underground in Neriaks Foreign Quarter. A community loom may be found at the Silk Underground in Neriaks Foreign Quarter.");
		end
	else
		if(e.message:findi("silk thread")) then
			e.self:Say("Silk Thread is sewn by a tailor using a [sewing kit] or a community [loom]. Two spiderling silks combined in the sewing kit or loom will create one silk thread.");
		elseif((e.message:findi("sewing kit")) or (e.message:findi("loom"))) then
			e.self:Say("A sewing kit may be purchased at the Furrier Royale in Neriaks Third Quarter or at the Silk Underground in Neriaks Foreign Quarter. A community loom may be found at the Silk Underground in Neriaks Foreign Quarter.");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19584})) then
		e.self:Say("So you are one of Ulraz's new recruits. You are to assist in the construction of the armor you will don as a new Shadowknight of the Lodge of the Dead. I have assembled a kit that is used in the crafting of Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
		e.other:QuestReward(e.self,0,0,0,0,17124);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41046 -- Krivn_S`Tai
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

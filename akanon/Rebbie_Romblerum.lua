-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. "!");
	elseif(e.message:findi("silk thread")) then
		e.self:Say("Silk Thread is created by combineing two spiderling silk in a sewing kit."); -- text is made up as i could not find the real text reply.
	elseif(e.message:findi("boot")) then
		e.self:Say("To assemble Plague Rust Boots you will require two [silk thread], two ruined ebon drakeling scales, and two rebel clockwork foot plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		e.other:SummonCursorItem(19561); -- Item: Tattered Boot Pattern
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a Plague Rust Bracer you will require a [silk thread], ruined ebon drakeling scales, and a rebel clockwork wrist section. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Wristband Pattern.");
		e.other:SummonCursorItem(19558); -- Item: Tattered Wristband Pattern
	elseif(e.message:findi("glove")) then
		e.self:Say("To assemble Plague Rust Gloves you will require two [silk thread], ruined ebon drakeling scales, and two rebel clockwork hand plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		e.other:SummonCursorItem(19559); -- Item: Tattered Glove Pattern
	elseif(e.message:findi("legging")) then
		e.self:Say("To assemble Plague Rust Leggings you will require three [silk thread], two ebon drakeling scales, and two rebel clockwork leg sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
		e.other:SummonCursorItem(19560); -- Item: Tattered Pant Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To assemble Plague Rust Sleeves you will require two [silk thread], ebon drakeling scales, and two rebel clockwork arm sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		e.other:SummonCursorItem(19557); -- Item: Tattered Sleeve Pattern
	elseif (e.message:findi("tunic")) then
		e.self:Say("To assemble a Plague Rust Tunic you will require four [silk thread], pristine ebon drakeling scales, a giant rat pelt, and a rebel clockwork chest plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		e.other:SummonCursorItem(19556); -- Item: Tattered Tunic Pattern
	elseif(e.message:findi("coif")) then
		e.self:Say("To assemble a Plague Rust Coif you will require two [silk thread], ruined ebon drakeling scales, and a rebel clockwork head plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
		e.other:SummonCursorItem(19555); -- Item: Tattered Cap Pattern
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 10988})) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. "! You must be one of Kaxon's new trainees. Kaxon has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Rust Mail you are planning on assembling. Do you wish to craft a [plague rust coif], a [plague rust bracer], [plague rust gloves], [plague rust boots], [plague rust sleeves], [plague rust leggings], or a [plague rust tunic].");
		e.other:QuestReward(e.self,0,0,0,0,17124); -- Item: Mail Assembly Kit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

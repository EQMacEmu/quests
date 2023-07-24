function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am the Fairie Princess, Joleena. You may stay amongst my people, but do not nibble from our homes.");
	elseif(e.message:findi("fairie gold dust")) then
		e.self:Say("You wish the magical Fairie Gold Dust? Hmmph!! I refuse to offer it to any of the giants of Faydwer. How can I trust any of you. You have crept up upon my me and snatched one of my wings from my back. There will be no Fairie Gold Dust until my wing has been returned to me. You may not be the stalker [who snatched my wing], but all you giants are similar. Prove me wrong and return my wing.");
	elseif(e.message:findi("wing")) then
		e.self:Say("I did not see the swift giant, I was blinded by the sun glaring off his balding head. I do remember the smell of rust and refuse. How he got past my Clockwork Guardian, Gearheart, is a mystery to us all.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12339})) then
		e.self:Say("My wing!! I am so happy!! Thank you " .. e.other:GetCleanName() .. ". You have proved that I can trust giants once again. Please take a Pouch of Fairie Gold Dust. Its magical properties are desired by all.");
		e.other:QuestReward(e.self,0,0,0,0,12333,1500);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("speaks in a hushed voice. barely audible. though the tones of an ancient and long past era emerge through the Iksar's unfamiliar accent. 'Greetings. " .. e.other:GetCleanName() .. ". The mystics of New Tanaan welcome you as an equal. We are scholars and no longer bound by the darkness of our shallow disdain for race or faith. However. each adept must teach only within their knowledge and as a shaman. I must extend my knowledge only to those who are of the same ilk. I have scribed many spells from my memory of the times past on Norrath and these spells are for any that they would aid.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

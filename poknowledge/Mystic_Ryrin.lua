function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail to you. " .. e.other:GetCleanName() .. ". The Mystics of New Tanaan extend their welcome to you. traveler. and hope that our knowledge will come of use to all that seek it. As an adept and shaman of the Tribunal. I have come to dismiss all former prejudice of race and accept each being as an equal to me in creation and existence. With the recent influx of travelers from Norrath to our city and the planes beyond. the citizens of New Tanaan have done what we can to assure that those who seek knowledge will have it at their disposal. The adepts maintain their art and thus you must seek the scholar of your class in order to receive proper guidance and aid that you might seek. I have scribed some spells from my past upon Norrath. and though they no longer prove useful to me in this place. I am certain that they will aid a shaman of Norrath should they be in need of them.");
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

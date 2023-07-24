function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("gives a generous smile. his broad face warmly lighting with his greetings. 'Welcome. welcome traveler! My my. let's have a look at ye. shall we? Hrm. . . yes. I can see how ye indeed be quite the adventurer! I can sense the ways o'the world about ye. Those feet 'ave traveled. but they have much more t'travel yet. I be thinkin'! Well. traveler. whilst ye be in New Tanaan. allow yeself a bit o'rest an' recreation. Let ye feet cool from the countless miles that lay behind 'em. but dinnae let ye mind fall weary! Nor ye hands if ye be a man o'the trades. If ye be a potter. by chance. then the fates are surely in your favor this day! I meself am a potter an' would be more pleased than a weary Deputy with the first mug o'Jumjum o'the day t'help ye! Search me wares. friend and dinnae be shy t'purchase anything that might catch yer fancy.'");
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

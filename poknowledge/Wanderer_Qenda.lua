function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings to you. traveler. and we warmly welcome you to our midst. New Tanaan holds a limitless fount of knowledge of past history. lore. and research of both the arcane and of faith. If you have come in search of knowledge that would guide you further in the protection of the sacred. natural world as one of its druids. then I may be of humble service to you. Do not hesitate to peruse my inventory should you have wish or need of it. All items that I possess are for a moderate price that will aid the city in furthering our research and guidance of all of Norrath's scholars.");
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

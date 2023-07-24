function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("gives a warm. toothy smile and pleasant nod of her head in greeting. 'An' good day t'ye. " .. e.other:GetCleanName() .. "! Well. what might 'have brought ye t'old Glena Quok. Hrm? Perhaps ye be a distinguished member o'the blacksmithin' arts. aye? Well. if that indeed be the case. then we certaintly be in luck! I am a bit familiar with the trade meself an' offer me services t'any smith who may 'ave use fer what I am offerin' at the time. Dinnae be shy. friend! Search me wares if ye be interested and purchase what ye like.'");
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

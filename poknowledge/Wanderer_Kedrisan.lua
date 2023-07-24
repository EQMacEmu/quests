function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. " and good day to thee. The halls of New Tanaan are open to any being of intelligence and self-empowered will that wishes to walk among its halls and libraries. so dinnae be frightened by my seemingly nonconformist presence here. Like my fellow citizens. I have pledged my knowledge to any visitor that has any need or wish of me. though I fear I may only be of use to the druids of the material world. If you believe that I could provide anything of use to you. then do not hesitate to browse my inventory. All of the spells there were penned by my own hand and my stock is always plentiful.");
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

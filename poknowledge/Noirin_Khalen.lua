function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("gives a gentile nod of her head in a proper and well-trained greeting. 'Good day to you " .. e.other:GetCleanName() .. ". and may the light of this place enlighten your quest for knowledge and understanding of our existence. I am Norin Khalen. a former enchanter and scholar of the world and a master jeweler of Erudin. In this place. in this time and era. I serve the people and the purpose as a craftswoman. My wares are suited for my art and are available to any aspiring jeweler that may wish to perfect their art whilst in our midst.  I also have the ability to translate special scrolls into knowledge of how to imbue planar gems.'");
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

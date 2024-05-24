--Dran_-Slug-_Rembor.pl
--Part of Innoruuk Regent

function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("ithvol")) then --Disciple Symbol of Innoruuk
			e.self:Say("So you're the lucky errand boy, eh?! Let's hope you are more successful than the last chump who was sent. From what I hear, there was something pretty important in that last crate that was sent out. It just looked like a bunch of junk to me. Anyhow, we ran out of steel boning. Bring me two bonings so we can bind up the crate and be quick about it! Both of our necks are on the line!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Gee, thanks, but I can't do a whole lot without the rest! Get your act straight or we're both dead!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12073, item2 = 12073},1,text)) then
		e.self:Say("Here's the crate of provisions. Take this to Dragoon Szorn in the Lesser Faydark immediately!");
		e.other:QuestReward(e.self,{itemid = 19030}); --Crate of Teir`Dal Provisions
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

--Drelynn's Gem Collection
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("A fine day to you, " .. e.other:GetCleanName() .. ". The exhibit you will see here soon will likely be the most valuable of them all. My display will house some of the most precious and rare gemstones you will ever find. It is too sad there are still spaces missing in my display box, if I could only find a few more [gems] to fill them out.");
	elseif(e.message:findi("gems")) then
		e.self:Say("To make the exhibit truly stand out, I would need to add a Blackened Sapphire, Greenscale Emerald, Shimmering Velium Ruby, and a Hope Diamond. Could I perhaps procure these from you? Visit [Merri] and get a Collector's Box from her. Carefully place the gems inside and close it up. Once you return this to me, I can pay you for your services.");
	elseif(e.message:findi("merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28077})) then--Collection of Gems
		e.self:Emote("inspects each gem carefully. 'These are in much better condition then I thought I would get them in. Adding these to my exhibit pleases me greatly. As promised, here is something for you.'");
		e.other:QuestReward(e.self,0,0,0,0,28242);--Fine Antique Veil
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

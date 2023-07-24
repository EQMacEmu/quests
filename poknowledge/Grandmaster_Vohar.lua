--Monk Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sneers coldly, his face contorting into a wretched, gruesome stare of hate. His eyes fill with an untamed, feral bloodlust as his low, hissing voice begins to seep from his throat. 'You stand within the district of Kartis -- the cradle of the seed of corruption in the universe. How strange it is that we find a child of the goodly mortal virtues willingly engaging in conversation with those they have sworn to destroy. I see that perhaps you feel yourself immune to the corruption, or that you will cast down your blade and use wit and the power of your 'pure' soul to overcome the shadow at its core. How amusing -- pathetically naive and vain, but amusing nonetheless. Learn from our adepts -- convince yourself it is a means to learn our secrets, if you will, but learn from us. You will serve us most efficiently without even a conscious awareness of your deeds.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {1201, 1202, 1203, 1204, 1205, 1206}); --Shiverback-hide Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

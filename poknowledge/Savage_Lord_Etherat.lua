--Beastlord Tomes/Planar Armor Exchange
--I added the tome handin, it didn't exist previously - Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("performs an ancient, graceful gesture that is seemingly arcane in nature, though no energy can be felt entering or dispersing in the room. 'Tanaan welcomes you to its midst, traveler, There is much to be found in the whole of New Tanaan and specifically, the great library of Myrist. However, there is only so much that the tangible world can teach you. friend. for true, infinite knowledge lies eternally beyond the confines of material and astral domains. Within yourself. your very spirit and the spirits that surround you lays the key to true enlightenment and self-progress. Should you follow the path of the Beastlords. then I may be of aid in guiding your further toward the realization of your potential and the true elements surrounding you.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {7817, 7818, 7819, 7832, 7833, 7834, 7835}); --Anthemion Armor
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

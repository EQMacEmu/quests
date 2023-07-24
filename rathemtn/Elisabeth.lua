function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Very good to meet you. " .. e.other:GetCleanName() .. ".  I am the keeper of the [Greaves of Ro].  Please feel free to rest and recuperate here.  We shall see that you are safe from the evils of the Rathe Mountains.");
	elseif(e.message:findi("greaves of ro")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Go to the countryside of Freeport.  There, you shall seek out any nightfall giants .  They have terrorized the countryside for too long.  They have protection from common weapons.  Rely on magic.  I failed in tracking them down.  You shall succeed and when return any single head to me. you shall be awarded the mold for the greaves.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go to Freeport.  There you shall find the Hall of Truth.  Within its walls you shall be instructed on how to better serve Mithaniel Marr.  When High Lord Dushire answers yes to the question, am [I an honored member], then you and I can become allies.");		
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12313})) then
		e.self:Say("You have done well.  These giants shall soon be purged from the Commonlands and the inns will be filled once again.  Here is the mold for the Ro Greaves.  For the final component, go and ask Thomas of [Lord Searfire].");
		e.other:Faction(e.self,281,20); --Knights of Truth
		e.other:Faction(e.self,362,4); --Priests of Marr
		e.other:Faction(e.self,311,2); -- Steel Warriors
		e.other:Faction(e.self,271,-3); -- Dismal Rage
		e.other:Faction(e.self,330,-3); -- Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,12303); --Mold of Ro Greaves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50109 -- Elisabeth
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("How's it going, scrub? Correct me if I'm wrong, but you appear to be a rogue. If you're a [new rogue], it's my job to test your skill.  If you are not, then by speaking with me, I see you show interest in [joining this house of rogues].");
	elseif(e.message:findi("new rogue")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- need higher than 0 indiff, maybe 50 but works at amiable for sure
			e.self:Say("We of the Ebon Mask must first be sure you are skilled with a blade. At the same time, we are attempting to create a new type of armor for our rogues. So it is the test of each young rogue to take this bag into Nektulos and fill it with three moss snake skins and three snake fangs, then combine them. We get the bag and you earn a little respect as well as the [Dark Shield of Ebon].");
			e.other:SummonCursorItem(17943); -- Item: Empty Bag
			e.self:Say("You have done nothing to upset the Ebon Mask, but there is much more which you must do before we do business.  Perhaps a task from Master Hekzin shall set things right.");
		else
			e.self:Say("You are quite bold to approach a member of the Ebon Mask. Now be smart and run away.");		
		end
	elseif(e.message:findi("what dark shield of ebon")) then
		e.self:Say("The Dark Shield of Ebon was made for the use of this house by the finest craftsmen of Neriak.  It can be carried in the hand as well as slung upon one's back.  Besides this advantage, it is much lighter than most other shields.");
	elseif(e.message:findi("joining this house")) then
		e.self:Say("We of the Ebon Mask must first be sure you are skilled with a blade. At the same time, we are attempting to create a new type of armor for our rogues. So it is the test of each young rogue to take this bag into Nektulos and fill it with three moss snake skins and three snake fangs, then combine them. We get the bag and you earn a little respect as well as the [Dark Shield of Ebon].");
		e.other:SummonCursorItem(17943); -- Item: Empty Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13889})) then
		e.self:Say("Fine work for a scrub. Maybe one day you will be able to test this new snakescale armor out. For the moment you shall take the [Dark Shield of Ebon] if you do not own one already.");
		e.other:Faction(e.self,320,-2); -- Faction: Wolves of the North
		e.other:Faction(e.self,262, -1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,244, 10); -- Faction: Ebon Mask
		e.other:Faction(e.self,263,-1); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,329,-2); -- Faction: Carson McCabe
		e.other:QuestReward(e.self,0,math.random(9),0,0,12258,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42046 -- Hekzin_G`Zule


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good to meet you. " .. e.other:GetCleanName() .. ".  Please look around.  I have much to offer.  I am a master woodworker.  It runs in the Parsini family.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18833})) then
		e.self:Say("I have been waiting for someone to come and retrieve this staff. Here you are. You will have to combine it with treant resin and an Odus pearl. You can find Odus pearls in the water in the harbor. As for the resin. I can make it if you can find me some treant shards.  Maybe another woodworker or cobbler in Qeynos has some.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,289,5); -- +Merchants of Erudin
		e.other:Faction(e.self,266,3); -- +High Council of Erudin
		e.other:Faction(e.self,267,3); -- +High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,17917,2500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13824})) then--Wooden Shards
		e.self:Say("Wonderful work!! These shards will work nicely. Here you are then. I found a few flasks of treant resin in the back. You can have one. Thanks again. It kept me from having to go out and hunt treants.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,289,5); -- +Merchants of Erudin
		e.other:Faction(e.self,266,3); -- +High Council of Erudin
		e.other:Faction(e.self,267,3); -- +High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,13822,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:tox  ID:38122 -- Emil_Parsini


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

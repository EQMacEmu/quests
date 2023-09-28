function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. A brother of the Indigo you must be. Why else would one dare to roam the corridors of the Cauldron of Hate? You were most likely sent to speak with Yegek. If so. speak up and tell Yegek who [sent] you.");
	elseif(e.message:findi("seloxia")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You are a new blood!  I shall help you to face the dangers. For now, you must listen. First we must be sure to increase your skill by combat. Take this bag to the outside and fill it with three beetle eyes and three bone shards from the undead. Combine and return it. Then we shall reward you and continue. Do not lose the short sword you had upon entering our brotherhood. We just may need it later on.");
			e.other:SummonCursorItem(17942); -- Item: Empty Bag
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	elseif(e.message:findi("second test")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You will now learn what happens to those undesirables who once called themselves Indigo. But first, you will hand me your sword which was given to you by the Indigo Brotherhood. This battle must be fought without a blade. Show us your strength!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	end	
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13887})) then
		e.self:Say("Very nice work. Here are some provisions. Now are you [ready for the second test]?");
		e.other:Faction(e.self,270, 5); --Indigo Brotherhood
		e.other:Faction(e.self,326,-1); --Emerald Warriors
		e.other:Faction(e.self,311,-1); --Steel Warriors
		e.other:Faction(e.self,1522,-10); --Primordial Malice
		e.other:QuestReward(e.self,5,0,0,0,eq.ChooseRandom(13005,13007),3000); -- confirmed exp data
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9998})) then
		e.self:Say("Those young warriors who dared to run from battle are now our fodder. They shall help us teach you that sometimes you must kill your own kind. In the center of the arena we have set a coward. Show me you can kill your own when required and bring me his head. Do not grant him mercy nor allow him to flee.");
		eq.spawn2(41119,0,0,-1218,-25,-25,128); -- NPC: TeirDal coward
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13888})) then
		e.self:Say("You have performed greatly. A coward deserves no pity or mercy. You will be fine addition to our house. Let us replace your weapon with this, a sullied two handed sword! The weapon of a young brother of this hall. It is a finer weapon than your first. Go and spread the hate of Innoruuk.");
		e.other:Faction(e.self,270, 15); --Indigo Brotherhood
		e.other:Faction(e.self,326,-2); --Emerald Warriors
		e.other:Faction(e.self,311,-1); --Steel Warriors
		e.other:Faction(e.self,1522,-30); --Primordial Malice
		e.other:QuestReward(e.self,5,0,0,0,10830,500);
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41031 -- Yegek_B`Larin
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("And who do you think you are? To step into the Cauldron of Hate one should have the black soul of a warrior. For one to speak with Trizam he should have good reason. Perhaps you return with tales of [deathfist] agendas. If so, then you're a year too late.");
	elseif(e.message:findi("deathfist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Have you been spending day and night at the Malden's Fancy?!! The Deathfist Orcs in the Commonlands are up to something. As the inept humans in Freeport hunt down the warrior orcs, the pawns run about on some secret mission. I have been appointed by King Nathox to attend to this matter and hire young warriors who wish to [collect] pawn kills.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	elseif(e.message:findi("collect")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes, You will. You need not know the reason why. I command you by order of King Naythox Thex to venture forth to the Commonlands and slay all the orc pawns you see. Return with four pawn picks and maybe I shall even reward you. Leave at once or you shall find yourself hanging from the Hooks of Innoruuk!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I instructed you to return with no fewer than four pawn picks!";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13885, item2 = 13885, item3 = 13885, item4 = 13885},1,text)) then
		e.self:Say("So you have done your part to serve the King. As instructed, I shall reward your good deed. But I choose to reward you with provisions from the pantries of Neriak. They shall keep you strong.");
		e.other:Faction(e.self,270,10); -- +Indigo Brotherhood
		e.other:Faction(e.self,326,-1); -- -Emerald Warriors
		e.other:Faction(e.self,311,-1); -- -Steel Warriors
		e.other:Faction(e.self,1522,-20); -- Primordial Malice
		e.other:QuestReward(e.self,0,5,2,0,eq.ChooseRandom(13022,13021),1000); -- Neriak Nectar, Rotgrub Rye
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


--EOF

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

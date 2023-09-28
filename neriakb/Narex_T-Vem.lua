--Narex_T-Vem.pl
--Fire Goblin Runner/Halfling Raider Helms

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Cauldron of Hate. If you are a young warrior, you have come to the right place. There are many [duties] to be performed. If you are a veteran of the blade, we welcome your return to service. Perhaps you return with a [Leatherfoot] skullcap?");
	elseif(e.message:findi("duties")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I am so glad you asked. There is one matter of importance with which you may be able to assist. It seems an Erudite has made camp in Lavastorm. He is powerful and we do not expect you to slay him. Your mission is to cut off his supply line. I hope you will [accept the mission].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	elseif(e.message:findi("accept the mission")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Go to the Lavastorm Mountain Range. It is a dangerous place, but the one you seek must leave by the direction you entered. He is a goblin. Apparently the Erudite is employing their strength. The fire goblin runner shall be an easy kill for you. At least, he should be. Return his runner pouch to me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	elseif(e.message:findi("leatherfoot")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Where have you been? The halflings of Rivervale have an elite force of warriors. They are called the Leatherfoot Raiders. They have been infiltrating our glorious city of Neriak for quite some time. They must be exterminated! I must hire strong warriors who wish to [collect the bounty].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	elseif(e.message:findi("collect the bounty")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("So you wish to collect the bounty on Leatherfoot Raiders? Then go into Nektulos and hunt them down. I shall pay a reward for no fewer than four Leatherfoot Raider skullcaps.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Fool! There shall be no reward until I have four skullcaps in my hands!";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13886})) then --Goblin Supply Pouch
		e.self:Say("Fine work. I trust the denizens of Lavastorm were not unkind. Please take this featherweight pouch as a reward. May it keep you fleet of foot.");
		e.other:Faction(e.self,270, 25); --Indigo Brotherhood
		e.other:Faction(e.self,326,-3); --Emerald Warriors
		e.other:Faction(e.self,311,-1); --Steel Warriors
		e.other:Faction(e.self,1522,-50); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,17972,17150); --Featherweight Pouch
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13113, item2 = 13113, item3 = 13113, item4 = 13113},1,text)) then --Leatherfoot Raider Skullcap -- this hand-in doesn't have faction check apparently
		e.self:Say("I had my doubts, but you have proven them false. You are a fine warrior. You must continue to refine you talents. I reward you with the footman's voulge! Welcome into our house of warriors. Let us share skills as we share foes.");
		e.other:Faction(e.self,270, 50); --Indigo Brotherhood
		e.other:Faction(e.self,326,-7); --Emerald Warriors
		e.other:Faction(e.self,311,-2); --Steel Warriors
		e.other:Faction(e.self,1522,-100); --Primordial Malice
		e.other:QuestReward(e.self,0,0,7,0,12257,25000); --Footman's Voulge ; confirmed exp data
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:neriakb  ID:41032 -- Narex_T-Vem

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

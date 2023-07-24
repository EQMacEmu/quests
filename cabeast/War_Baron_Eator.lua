function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("turns to you and snorts in anger. Some mucus lands on your cheek. 'Troopers! I thought I ordered you to keep all new recruits away from this chamber! Go, child. The War Baron of Cabilis has no time for games. See this intruder out!!'");
	elseif(e.message:findi("memory")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("takes a step back and thinks to himself. Phlegm dribbles off his lips. 'The Memory of Sebilis. Kept within my personal chambers. They have been taken. Taken by some croakin' Forsaken no doubt!! You have been sent to me because you show excellent prowess. Find my Memory and bring it to me with your footman's pike.'");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("trooper")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("So you are a trooper? Word of your deeds has been spreading through the legion. If you truly wield the pike of a trooper, then go and serve the garrisons of swamp, lake and woods. Report to the Warlord and tell him you are a [trooper reporting for duty]. Their recommendations and your trooper pike shall earn you the rank of legionnaire.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I await three letters of recommendation and your trooper pike.";	
	local text2 = "shines a bright smile which quickly fades to a frown. 'The memory is not complete. ..sniff, sniff.. A reward for my memory and your footman's pike.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18464, item2 = 22919})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(e.self,444,2); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18463, item2 = 22918})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(e.self,444,2); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12899, item2 = 12898, item3 = 12896, item4 = 5132},1,nil,text2)) then
		e.self:Emote("gulps down a wad of phlegm. 'My memory has returned! " .. e.other:GetCleanName() .. "! You are no footman. I grant you the rank of soldier. Go and forge your weapon. Do not return to me until you become a [brave trooper of the empire].'");
		e.other:Faction(e.self, 440,20); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 441,5); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 445,5); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 444,5); -- Faction: Swift Tails
		e.other:Faction(e.self, 442,5); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,12476,800);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18073, item2 = 18072, item3 = 18074, item4 = 5134},1,text1)) then
		e.self:Emote("takes away your pike and hands you plans not for a pike head, but for the crown of another polearm. 'It is time to wield the weapon of a [true warrior of the legion]. You have done well, Legionnaire " .. e.other:GetCleanName() .. "!'");
		e.other:Faction(e.self, 440,2); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 441,2); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 445,2); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 444,2); -- Faction: Swift Tails
		e.other:Faction(e.self, 442,2); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,12478,4000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

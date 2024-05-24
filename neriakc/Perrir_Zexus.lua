function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Say("Salutations, " .. e.other:GetCleanName() .. "! Your devotion to our Lord Innoruuk is evident in your actions and on your soul. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the [hematite symbol of Innoruuk] worn by the initiates of the Spires.");
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
			else
				e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		
			end
		elseif(e.message:findi("hematite symbol of Innoruuk")) then
			if(e.other:GetFactionValue(e.self) >= 150) then
				e.self:Say("The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk.");
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
			else
				e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		
			end
		end
	else
		if(e.message:findi("hail")) then
			if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Say("Salutations, " .. e.other:GetCleanName() .. "! Your devotion to our Lord Innoruuk is evident in your actions and on your soul.");
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
			else
				e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		
			end	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 150 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14550, item2 = 14550, item3 = 14550, item4 = 14550})) then--Woven Grass Amulets
		e.self:Say("You have done well, young initiate. I grant you this medallion invested with the divine hatred of Innoruuk. Wear it proudly as a representation of your importance to these sacred spires. Now, if you will excuse me, I must proceed with the burning of these pathetic halfling symbols of faith.");
		e.other:Faction(e.self,340,50);--Priests of Innoruuk
		e.other:Faction(e.self,278,7);--King Naythox Thex
		e.other:Faction(e.self,362,-17);--Priests of Marr
		e.other:Faction(e.self,226,-12);--Clerics of Tunare
		e.other:Faction(e.self,341,-7);--Priests of Life
		e.other:Faction(e.self,1522, -200); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,1369,2000); --Initiate Symbol of Innoruuk
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18756})) then --Tattered Note
		e.self:Say("Welcome, child of Hate. I am Perrir Zexus, High Priest. We all draw power from the very source that created us, the will of Innoruuk. Here, put on this tunic. It is the tunic of our guild. Represent us well.");
		e.other:Faction(e.self,340, 100); --Priests of Innoruuk
		e.other:Faction(e.self,278, 15); --King Naythox Thex
		e.other:Faction(e.self,362, -35); --Priests of Marr
		e.other:Faction(e.self,226, -25); --Clerics of Tunare
		e.other:Faction(e.self,341, -15); --Priests of Life
		e.other:Faction(e.self,1522, -400); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,13585,20); --Crimson Training Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18148})) then --Note of Recommendation
		e.self:Say("" .. e.other:GetCleanName() .. ", eh? My sister has a keen perception for seeing into a person's soul. You may store an abundance of hate but hate can be devoted to different ideals. Prove to me your devotion to our Lord Innoruuk by bringing me the skullcap of a Leatherfoot Raider who has invaded our forest. Go, " .. e.other:GetCleanName() .. ", and do as I have requested.");
		e.other:Faction(e.self,340, 200); --Priests of Innoruuk
		e.other:Faction(e.self,278, 30); --King Naythox Thex
		e.other:Faction(e.self,362, -70); --Priests of Marr
		e.other:Faction(e.self,226, -50); --Clerics of Tunare
		e.other:Faction(e.self,341, -30); --Priests of Life
		e.other:Faction(e.self,1522, -800); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,0,750);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13113})) then --Leatherfoot Skullcap
		e.self:Say("Fine work, " .. e.other:GetCleanName() .. "! You are well on your way to reaping the rewards of the Spires of Innoruuk.");
		e.other:Faction(e.self,340, 10); --Priests of Innoruuk
		e.other:Faction(e.self,278, 1); --King Naythox Thex
		e.other:Faction(e.self,362, -3); --Priests of Marr
		e.other:Faction(e.self,226, -2); --Clerics of Tunare
		e.other:Faction(e.self,341, -1); --Priests of Life
		e.other:Faction(e.self,1522, -40); --Primordial Malice
		e.other:QuestReward(e.self,8,5,0,0,0,250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42084 -- Perrir_Zexus
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

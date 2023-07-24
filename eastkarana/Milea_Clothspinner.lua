function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail, fellow adventurer. Are you [from Qeynos] or from [somewhere else]?");
		elseif(e.message:findi("qeynos")) then
			e.self:Say("A great city. I was born there. I trained in the [Hall of Steel] my whole life to become a warrior. I have a sister who still calls Qeynos home.");
		elseif(e.message:findi("hall of steel")) then
			e.self:Say("The Hall of Steel is the training ground for the greatest warriors of Antonica. I was trained by Ebon Strongbear. Now I travel the lands of Norrath. Maybe the bards will write songs of us both one day. To be an adventurer is the only way to truly live!");
		elseif(e.message:findi("somewhere else")) then
			e.self:Say("Too bad. It is a good city to hail from. Safe from evil. I grew up there and found it quite peaceful. I trained at the [Hall of Steel].");
		elseif(e.message:findi("kane")) then
			e.self:Say("Kane Bayle and I were students together at the Hall of Steel. He was quite a swordsman. The only men in Qeynos who could best him were Ebon Strongbear and his own brother, Antonius.");
		elseif(e.message:findi("antonius")) then
			e.self:Say("Antonius Bayle is the ruler of the kingdom of Qeynos. Many lands look to Qeynos for protection and backing. Kane is captain of the Qeynos Guards. Two brothers working hand in hand to unite a world.");
		elseif(e.message:findi("nerissa")) then
			e.self:Say("Nerissa Clothspinner is my sister. She is all the family I have left. I hated to leave Qeynos, but my soul yearned for adventure. I am sure she is safe, though. I had my old friend Kane Bayle promise to watch over her.");
		end
	else
		e.self:Say("As a member of the Steel Warriors I cannot abide you. Please leave before you force me to bloody my blade.");		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18801})) then
		e.self:Say("My sister is in danger. She is all the family I have left. I shall be on my way soon. Please take her my handkerchief, so she knows you have contacted me. Thank you. I am thankful Nerissa ran into you. I just wonder why she did not tell Kane about her suspicions.");
		 -- confirmed live factions
		e.other:Faction(e.self,311,10,0); -- Faction: Steel Warriors
		e.other:Faction(e.self,262,2,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,2,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,13302,2000); -- Monogrammed Cloth
		eq.unique_spawn(15193,11,0,-5521,-1870,3,226); -- NPC: #Guard_Elias
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18934})) then -- sealed letter', filename='LoveToMilea'
		e.self:Say("Oh great!! I thought I'd saw that last of Plagus, or as all the women in the Steel Warriors called him, the Plague. Please do not tell him where I am. It must have been a long journey for you. Here. A little something for your wasted trip. I found it on the ground. Have fun going back to Freeport.");
		 -- confirmed live factions
		e.other:Faction(e.self,311,5,0); -- Faction: Steel Warriors
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(3040,1037,17005,13003,10008,1005,8791,1331,2910),2000); -- Item(s): Blackened Iron Coif (3040), Fur Lined Shoes (1037), Backpack (17005), Small Lantern (13003), Gold Ring (10008), Cloth Shawl (1005), Ruined Rawhide Leggings (8791), Damask Cap (1331), Grizzly Hide Cloak (2910)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Get out of here! It is time I dealt with this traitorous guard. Okay guard, let's get it on!!");
		eq.signal(15193,1,5000);  -- to Guard Elias
	end
end

-- END of FILE Zone:eastkarana  ID:15055 -- Milea_Clothspinner 


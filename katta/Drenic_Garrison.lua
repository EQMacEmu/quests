function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am Drenic Garrison, Governor of Science here in Katta Castellum. I am currently involved in several scientific endeavors with the other governors and am in need of assistance supplying my researchers with the proper [materials and samples] for their studies.");
	elseif(e.message:findi("materials and samples")) then
		e.self:Say("The Magus Conlegium are assisting with some studies on the physiology of the Vampyres of the Coterie of the Eternal Night and are in need of [ash and blood] samples. Maralicis Dilsm our Governor of Health is assisting in research on [counteragents] to the venom and diseases native to Luclin. Finally, there have been reports from the agents of Erikal Wolfeye that there is a civilation of [snake people] that live on the furthest reaches of the light side of Luclin in a region devoid of atmosphere.");
	elseif(e.message:findi("ash and blood")) then
		-- Start of Vampyre Ash and Blood
		e.self:Say("Every four piles of vampyre ashes or four samples of vampyre blood that is collected should be delivered to Avir Sterbla in the Magus Conlegium. Avir is the Governor of Magician Studies and is currently working with Kellari Autumnfall, Lathin Firetree, and myself on developing better weapons and spells to battle the Coterie of the Eternal Night. Avir is zealous in his battle with the vampyres, he lost a relative to their wicked coterie many years ago.");
	elseif(e.message:findi("counteragents")) then
		-- Start of Counteragents
		e.self:Say("Since our Empires first arrival on Luclin a citizen or in some cases several citizens occasionally fall victim to terrible diseases and toxins. The effects on our people were devastating at first but over the years we have become more accustomed to life on this moon. Still, if we were able to eradicate these diseases and poisons entirely many lives would be saved. The damp subterranean Fungus Grove and Paludal caverns are among the most infested areas. If you brave those dank passageways and return with a Muck Beetle Mandible, Black Fungal Fiend Spores, Green Fungal Fiend Spores, and a Grimfang Poison Sack I will gladly take them to the researchers for further study and experimentation.");
	elseif(e.message:findi("snake people")) then
		-- Start of Undead Snake Organs
		e.self:Say("To the west beyond the Twilight Sea is an airless grey region between the light and dark sides of Luclin. Some time ago our scouts cooperating with powerful members of the Magus Conlegium attempted to chart the expanses of the barren treacherous region. During this excursion the scouts and magi encountered a small group of strange snake like men. The magi detected no magical aid that was allowing the creatures to move freely in the airless void without danger of suffocation. When approached the snake men quickly fled. We wish to know how these creatures survive in such conditions. If they prove to be a hostile species then we will have to resort to examining their [anatomy].");
	elseif(e.message:findi("anatomy")) then
		-- Part of Undead Snake Organs
		e.self:Say("I wish to examine the lungs or whatever breathing organs these creatures have. It would not be prudent to hunt and kill a living member of this species and society we know practically nothing about but there are several undead snake men in the region as well. I will require three such organs however to perform the proper experiments.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require three organs from the snake people.";

	-- Handin: 1x Muck Beetle Mandible (10412), 1x Black Fungal Fiend Spores (10413), 1x Green Fungal Fiend Spores (10414), 1x Grimfang Poison Sac (10415)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10412,item2 = 10413,item3 = 10414,item4 = 10415})) then
		-- End of Counteragents
		e.self:Say("Excellent work, the Loyalist Empire is grateful for your assistance. Governor Maralicis and I will have our researchers resume their work on curing Luclin of its diseases.");
		e.other:Faction(e.self,1504,5);  -- +Magus Conlegium
		e.other:Faction(e.self,1502,1);  -- +Katta Castellum Citizens
		e.other:Faction(e.self,1503,1);  -- +Validus Custodus
		e.other:Faction(e.self,1483,-1); -- -Seru
		e.other:Faction(e.self,1484,-1); -- -Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- -Eye of Seru
		e.other:Faction(e.self,1541,-1); -- -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,31743,5000); -- Mug of Purifying Tonic  
	-- Handin: 3x Shissar Organs (10416)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10416,item2 = 10416,item3 = 10416},1,text)) then
		-- End of Undead Snake Organs
		e.self:Say("Excellent work " .. e.other:GetCleanName() .. "! The acquisition of these organs is a fantastic accomplishment!");
		e.other:Faction(e.self,1504,10);  -- +Magus Conlegium
		e.other:Faction(e.self,1502,1);  -- +Katta Castellum Citizens
		e.other:Faction(e.self,1503,1);  -- +Validus Custodus
		e.other:Faction(e.self,1483,-1); -- -Seru
		e.other:Faction(e.self,1484,-1); -- -Hand of Seru
		e.other:Faction(e.self,1485,-2);  -- -Eye of Seru
		e.other:Faction(e.self,1541,-1); -- -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,31744,5000); -- Amulet of the Grey Wastes 
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I only train those who follow the path of the Patriarchs of Cabilis and have yet to develop their [powers] over the beasts of the wild.");
	elseif(e.message:findi("powers")) then	--Armor of the Patriarch Quest
		e.self:Say("A Patriarch of Cabilis must learn to survive the hard way, by heading into the wild lands and mastering the creatures that reside in them. First you must learn to defeat even the most insignificant of nuisances. Go from this temple and return to me with four Leech Husks that have been skinned from the creatures by your own claws.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I requested the husks of four leeches.";
	local text1 = "I requested three spiderling silks and the carapace of a scarab.";
	local text2 = "I requested four goblin watchers torches.";
	local text3 = "I requested two Goblin Hunter Javelins and two Sarnak Broodling Fangs."
	local text4 = "I requested four of the Froglok Tuk Bucklers.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12686, item2 = 12686, item3 = 12686, item4 = 12686},1,text)) then	-- 1st Test of the Patriarch
		e.self:Say("Well done young patriarch! I believe you are ready to face larger nuisances that prowl outside our city walls. Head out to the Field of Bone and return to me bearing three Spiderling Silks and a Scarab Carapace.");
		-- Confirmed Live Experience and Faction
		e.other:Faction(e.self,445,5); -- Faction: Scaled Mystics
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{itemid = 7827,exp = 250}); -- Item: Patriarch's Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13099, item2 = 13099, item3 = 13099, item4 = 13849},1,text1)) then	-- 2nd Test of the Patriarch
		e.self:Say("You have overcome sturdy yet unintelligent creatures that plague our kind. You are now ready to face our foes that are more intelligent than the insects you have defeated. We have many foes possessing a degree of intelligence, the least of these foes being the tribes of goblins that inhabit our Empires lands. Even now there are goblin watchers prowling just outside our gates. Locate four of these watchers, slay them and return to me with their Goblin Watcher Signal Torches.");
		-- Confirmed Live Experience and Faction
		e.other:Faction(e.self,445,5); -- Faction: Scaled Mystics
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{itemid = 7828,exp = 400}); -- Item: Patriarch's Cap
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12441, item2 = 12441, item3 = 12441, item4 = 12441},1,text2)) then	-- 3rd Test of the Patriarch
		e.self:Say("You have triumphed over the watchers, young patriarch, but they are among the weakest of our sentient foes. Mere fodder sent to warn to the more powerful goblins of an opportunity to strike. It is time for you to face the Goblin Hunters, and learn of our enemies the Sarnak, a species of dragonmen that once served the Iksar Empires of old. Journey to the wilderness and return with two Goblin Hunter Javelins and two Sarnak Broodling Fangs.");
		-- Confirmed Live Experience and Faction
		e.other:Faction(e.self,445,8); -- Faction: Scaled Mystics
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{itemid = 7829,exp = 600}); -- Item: Patriarch's Leggings
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14599, item2 = 14599, item3 = 12432, item4 = 12432},1,text3)) then	-- 4th Test of the Patriarch
		e.self:Say("Now you will learn of another enemy of the Legion of Cabilis, the frogloks. The frogloks from the froglok settlement of Krup often sent their tuk warriors to prey on unsuspecting Iksar citizens that ventures outside the gates of Cabilis. Find these Froglok Tuk Warriors and return with four of their buckler shields.");
		-- Confirmed Live Experience and Faction
		e.other:Faction(e.self,445,10); -- Faction: Scaled Mystics
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{itemid = 7830,exp = 1000}); -- Item: Patriarch's Claw
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8999, item2 = 8999, item3 = 8999, item4 = 8999},1,text4)) then		-- 5th Test of the Patriarch
		e.self:Say("Congratulations young Patriarch, you have learned all that I can teach you at this time. You must venture forth now on your own and fulfill the fate that has been glimpsed by the Hierophants before your hatching.");
		-- Confirmed Live Experience and Faction
		e.other:Faction(e.self,445,10); -- Faction: Scaled Mystics
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{itemid = 7831,exp = 1000}); -- Item: Patriarch's Leather
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18848})) then	--A tattered note
		e.self:Say("The Hierophants have sensed that your spirit is strong with obedience inspiring fear! You must learn to harness your [powers] over the scaled wolves! Wear this tunic so that the Legion of Cabilis will recognize you as a Scaled Spiritist.");
		e.other:Faction(e.self,445,15); --Scaled Mystics
		e.other:Faction(e.self,441,3); 	--Legion of Cabilis
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,{itemid = 13577,exp = 100}); --Dusty Green Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

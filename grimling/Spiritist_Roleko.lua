-- Rakshasa Skulls

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings Traveler. If it is rest you seek then I'm sure you may rest safely within the walls of this outpost. As the sentries keep watch for physical danger I commune with the spirits of this territory to watch for less noticeable threats.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I require both the crate of tortured vah shir skulls and the report from Roshawna."
	local text2 = "I require the head of the possessed grimling and the skulls of the reanimated grimlings"
	local text3 = "In order to perform the ritual I require the Amulet of Golden Rays, Black Flame Charcoal, Thought Leech Brain, and Materialization Ritual"
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31840,item2 = 31841}, 1, text1)) then -- Resealed Warded Iron Bound Chest, Roshawna's Report of Occurrences
		e.self:Say("It was wise of Roshawna to send you to me instead of risk bringing something so tainted by the dark spirits within the walls of Shar Vahl. I shall begin the ritual immediately. What is that?! Look! There is a grimling heading this way followed by what appear to be grimling undead. Defend me while I perform the ritual. Give me the head of that grimling and the skulls of those undead!");
		e.other:Faction(e.self,1533,5);
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.unique_spawn(167037,0,0,-956,-884,3,0):AddToHateList(e.other,1);
		eq.spawn2(167038,0,0,-956,-893,5,0):AddToHateList(e.other,1);
		eq.spawn2(167038,0,0,-956,-900,7,0):AddToHateList(e.other,1);
		eq.spawn2(167038,0,0,-956,-907,10,0):AddToHateList(e.other,1);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31847,item2 = 31848,item3 = 31848,item4 = 31848}, 1, text2)) then -- Possessed Grimlings Head, Reanmiated Grimling Skull
		e.self:Say("I am grateful for your assistance. I will be able to complete the rest of the ritual without danger now that the spirits in the skulls have been calmed. Please take this report of occurrences to Scribe Cholsa in Shar Vahl.");
		e.other:Faction(e.self,1533,4);
		e.other:QuestReward(e.self,0,0,0,0,31849,1000); -- Rolekos Report of Occurrences
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10777,item2 = 10778,item3 = 10779,item4 = 10915}, 1, text3)) then -- Amulet of Golden Rays, Black Flame Charcoal, Thought Leech Brain, Rakshasa Materialization Ritual
		e.self:Say("I will need to maintain my concentration to keep the Rakshasa from escaping back into the spirit realm. If you kill him while he is materialized he will be slain and his body will remain material. Bring me the head of the Rakshasa when he is slain.");
		e.other:Faction(e.self,1533,5);
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.unique_spawn(167039,0,0,-967,-867,0,0):AddToHateList(e.other,1); -- Rakshasa Karwoaro
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10916}, 0)) then
		e.self:Say("The threat of the Rakshasa appears to be eliminated. You have the gratitude of the Dar Khura for your bravery and assistance. Let us be wary however, the Rakshasa gained his power by allying with dark spirits that may not be indifferent to the Rakshasas death.");
		e.other:Faction(e.self,1533,20);
		e.other:QuestReward(e.self,0,0,0,0,31837,5000); -- Shield of Bane Warding
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


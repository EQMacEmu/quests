function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("gasps in astonishment. 'Who do you think you are coming to my island?  I didn't invite you!");
	elseif(e.message:findi("island")) then
		e.self:Say("It's my island and no one else's! This is where I hang out to blow stuff up, well that and they kicked me out of Katta.");
	elseif(e.message:findi("blow stuff")) then
		e.self:Say("Yeah that's what I usually do here.  Why so interested, are ya a fellow wizard?");
	elseif(e.message:findi("wizard")) then
		e.self:Say("Oh boy do I have something that you want. A nice set of wizardly armor that you can really waggle yer fingers in.");
	elseif(e.message:findi("armor")) then
		e.self:Say("It's not free that's for sure. If you want the armor I have the cap, robe, sleeves, pants, shawl, bracer and sandals. My buddy Trizpo has the rest you should go ask him about the armor.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you'll have to fetch me a cloud jewel, a mark of potency, and book of applied magic.");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap you'll have to fetch me a meteor jewel, some explosive dust, a mark of explosion, and a book of wizardry.");
	elseif(e.message:findi("pants")) then
		e.self:Say("For the pants you'll have to fetch me a moon jewel, a mark of energy, a gilded branch and some fiery sand.");
	elseif(e.message:findi("robe")) then
		e.self:Say("For the robe you'll have to fetch me an astral jewel, a mark of sorcery, a book of sorcery, and a globe of power.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals you'll have to fetch me a sky jewel, a mark of intensity, and a sun stained steel rod.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl you'll have to fetch me a star jewel, a mark of force, and some tro jeg toes.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves you'll have to fetch me a sun jewel, a mark of implosion, some grub worm guts, and a fiery heart.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4724,item2 = 4491,item3 = 4723},1,text)) then -- bracer
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3715,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4711,item2 = 4709,item3 = 4710,item4 = 4493},1,text)) then -- cap
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3710,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4720,item2 = 4719,item3 = 4718,item4 = 4489},1,text)) then -- pants
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3713,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 4713,item3 = 4714,item4 = 4712},1,text)) then -- robe
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3711,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4725,item2 = 4492,item3 = 4726},1,text)) then -- sandals
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3716,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4721,item2 = 4490,item3 = 4722},1,text)) then -- shawl
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3714,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4717,item2 = 4716,item3 = 4715,item4 = 4488},1,text)) then -- sleeves
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3712,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1502,5); -- Katta Castellum Citizens
	e.other:Faction(e.self,1503,1); -- Validus Custodus
	e.other:Faction(e.self,1504,1); -- Magus Conlegium
	e.other:Faction(e.self,1499,-2); -- Citizens of Seru
	e.other:Faction(e.self,1483,-1); -- Seru
	e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
end

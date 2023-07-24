function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sets down several large crustacean shells covered in foreign runes, then extends his large, coarse hands in a gesture of friendship. 'I am pleased to see friendly visitors to our villages. I am the head craftsman of the village. The crustacean shell armor worn by the warriors of our village was crafted by me and by my apprentices. I will craft other materials as well when they are available.'");
	elseif(e.message:findi("crustacean shell armor")) then
		e.self:Say("It takes awhile to make each piece. It has to go through a long burning process to clean away all old meat and dirt. Then it needs shaping and etching with runes.");
	elseif(e.message:findi("burning process")) then
		e.self:Say("Usually I use a mixture made from the livers of barraccudas. Their liquids are very strong and make good burning liquid. If you want some you need to bring me two barraccuda livers.");
	elseif(e.message:findi("other material")) then
		e.self:Say("I am able to craft dragon scale armor but it has been a long time since I have had the opportunity to do so for my people. What kind of scales do you wish for me to craft?");
 	elseif(e.message:findi("emerald dragon scale")) then
		e.self:Say("I will craft an emerald dragonscale tunic for emerald dragon scales, ulthork tusks, and an unstained fine plate breastplate.");
	elseif(e.message:findi("sea dragon scale")) then
		e.self:Say("Should you slay Kelorek'Dar, the sea dragon, I would craft you a sea dragon bracer from his scales. All I ask for are the scales of the dragon, an ornately runed shell necklace, and an unstained bracer crafted of the metal you strange ones call fine steel.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I'm sorry strange one. That is not a sufficient barter.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30059,item2 = 30059}, 0)) then
		e.self:Emote("slams a knife into the various livers and squeezes out all of their various goos and juices.  Eventually he separates a bit of it and pours it into a protective bladder.  'Excellent work.  This good catch.  Here, you have sack of ooze.  Its good for burning things off or etching metals.  Thank you for your help.");
		e.other:QuestReward(e.self,0,0,0,0,30060);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22823,item2 = 24874,item3 = 21004},1,text1)) then
		e.self:Emote("skillfully crafts the Emerald Dragon Scales into a tunic, hands it to " .. e.other:GetCleanName() .. ", and claps enthusiastically.");
		e.other:Faction(e.self,432,5); -- Faction: Othmir
		e.other:Faction(e.self,431,-1); -- Faction: Ulthork
		e.other:QuestReward(e.self,0,0,0,0,11635,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22814,item2 = 28515,item3 = 21009})) then
		e.self:Emote("skillfully crafts the Sea Dragon Scales into a bracer, hands it to " .. e.other:GetCleanName() .. ", and claps enthusiastically.");
		e.other:Faction(e.self,432,5); -- Faction: Othmir
		e.other:Faction(e.self,431,-1); -- Faction: Ulthork
		e.other:QuestReward(e.self,0,0,0,0,11589,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

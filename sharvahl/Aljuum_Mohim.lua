--Aljuum_Mohim

function event_say(e)
	if(e.message:findi("wolves")) then
		e.self:Say("The wolves that I speak of have no need for sight. They are products of the darkness that surrounds us. Their ability to move in the darkness and attack in packs makes them a serious threat to any Vah Shir that walks beyond our city's gates. I fear them more than I fear the twisted little people that live in the caves around here. It is the duty of each citizen to help control the number of these creatures. Fill the bag that I just handed you with the jawbones of two young sonic wolves and I'll know that you have a real understanding of the ferocity of those creatures. If you return, I'll have something that you may find interesting.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5967})) then
		e.self:Say("That is quite a lute. Gawfed has an incredible gift in that area. I don't have the patience to build instruments. I prefer to use my time for other things. I'm sure that Gawfed will fill you in on the more delicate side of our craft when he gets over his holiday. Until that time, I'll get you started on the other part of being a Jharin. Here, take your lute and this bag. Once you get that stowed away, buy me a drink. If you can guess my favorite drink, I'll start you on your lesson.");
		e.other:QuestReward(e.self,{items = {5967,17112}}); -- Item: Blue Cloth Bag
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22154})) then
		e.self:Say("Very good! I guess I should get you started.' He says as he finishes the drink that you just purchased. 'Our kin have encountered a number of beasts since the time of our arrival here. Your lesson today will center around one such creature. Maybe that will give you a better understanding of our role here. Bah, Taruun scouts... a real Jharin can do twice as much in combat... well, I digress. You're here to learn about [wolves], not my petty animosities.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 6157})) then
		e.self:Say("How was your little encounter with those beasts? Quite nasty in combat, eh? I told you as much. Well, now that you've seen them firsthand, I'll tell you how to deal with them like a true hunter. Take this hilt piece and show Hana Sulm. She'll give you some sketches. Once you have those sketches, go to Arms Historian Qua and purchase the tomes on Wolf Bane Lore or something like that. He'll know what you mean. You can use those books and the sketches to make a weapon that offers considerable power against those wolves. Once you have the weapon, bring it to me with your apprentice cloak. I'll have something for you. Now go away and let me finish this drink.");
		e.other:Faction(e.self, 1513,10 ); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,6144);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 6158, item2 = 5966})) then
		e.self:Say("Congratulations "..e.other:GetCleanName()..".  You have successfuly navigated to the status of Journeyman.  Take your dagger and this cloak, wear it with pride.");
		e.other:QuestReward(e.self,{items = {6159,6158},exp = 10000}); -- Item: Sonic Wolf Bane Dagger
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

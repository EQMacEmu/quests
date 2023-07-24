function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonCursorItem(2873); -- Item: Application for Citizenship
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found a grimling wearing this in the pit. Try not to lose it this time.");
		e.other:SummonCursorItem(2878); -- Item: Initiate's Cloak of Shar Vahl
	elseif(e.message:findi("love potion")) then
		e.self:Say("Love potion? Sounds intriguing but not familiar, I am afraid I cannot help you. However, if I were looking for information about potions and the alchemical arts, I would see Spiritist Ragnar. He has a shop just outside of the palace.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I know many of the taverns and eateries have their own barrels, but you may want to try Jakhal and Kahala's Brewery. You can find it in the southwestern section of the Merchant's Quarter, or Corridor of Heroes, as I like to call it..");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "This item, by itself, means nothing to me.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30962})) then
		e.other:QuestReward(e.self,0,0,0,0,15225);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18551})) then -- Dar Khura Guild Summons
		e.self:Say("Good " .. e.other:GetCleanName() .. ", I am honored to meet you. You have come of age and it is time for you to register for citzenship of Shar Vahl. The Dar Khura, spiritual guides of our people, have sensed your spirit and deem you to be worthy of our training. First things first, take this application to Registrar Bindarah and return to me with proof of citzenship.");
		e.self:Say("I know that you may be nervous right now... after all, this should be very exciting first step for you. If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions. They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,{itemid = 2873,exp = 20}); -- Application for Citizenship
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2897,item2 = 2877}, 1, text)) then --Notorized Application
		e.self:Say("Welcome back, " .. e.other:GetCleanName() .. "! I see that your documents are in order and you are an official citizen of Shar Vahl, which is great news! Let me be the first to welcome you to the ranks of the Dar Khura! Here, take this cloak and wear it with pride.");
		e.self:Say("Present your acrylia slate to spiritist Fehril and he will guide you through your early training. May the strongest of our ancestral spirits be your inspiration.");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,{items = {2877,2878},exp = 450}); -- Item: Acrylia Slate of Shar Vahl, Initiate's Cloak of Shar Vahl
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30963}, 0)) then
		e.self:Emote("examines the contents of the bag carefully. This is no ordinary spirit " .. e.other:GetCleanName() .. ". It is a whisperling, a bringer of dreams. You are quite lucky, I think she will go with you. She will be able to protect you from cold magic. If you need more protection you can call on her to help you endure the cold. This is how the Dar Khura weave their spells, we ask the spirits for their aid. This scroll will show you how to call on her for her protection. You will also need to construct her a more suitable spirit anchor. This claw will not contain her much longer. Please hurry to Ragnar with the claw and a fresh [bloodling carapace]. It may buy us some time before she fades away.");
		e.other:QuestReward(e.self,{items = {15225,30964},exp = 1000});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		eq.set_anim(4052,1);
	elseif(e.wp == 5) then
		e.self:SetRunning(true);
	elseif(e.wp == 9) then
		e.self:SetRunning(false);
	elseif(e.wp == 12) then
		eq.set_anim(4052,1);
	end
end

function event_signal(e)
	e.self:Say("I am f.. fff.. fff.. fine, brother. You um.. don't need to worry about me so much. I am a big girl now.");
	eq.signal(4055,5); -- NPC: Baobob_Miller
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Um.. I do not know you. Please um.. leave me be.");
	elseif(e.message:findi("baobob sent")) then
		e.self:Say("Oh.. Hello. My name is Chanda. " .. e.other:GetCleanName() .. " is your name? That's a nice name. My [brother] sent you to talk to me? You must want some bear.. um.. [clothes].");
	elseif(e.message:findi("brother")) then
		e.self:Say("umm.. My brother.. Um.. I mean my BROTHER.. He is the finest tanner there is. His name is Baobob and I love him very much.");
	elseif(e.message:findi("clothes")) then
		e.self:Say("I um.. know how to make.. umm.. [cloaks] and [boots]. Oh yes! and belts! I love to make bear skin belts! Um.. I really like [belts]. My [brother] says I have to start charging more gold for my stuff though..");
	elseif(e.message:findi("cloak")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I.. um.. can make.. um.. a good cloak for you. You have to get me a bear skin of high quality and my brother says I should not make them unless you also give me 21 gold pieces. I used to give them away but [Baobob] got mad at me so I don't do that anymore.");
		else
			e.self:Say("I...  um...  don't know you well enough to help you with th... th... that...  If you um... do stuff... for me and my brother or our family and friends in the Plains of Karana I might... um... reconsider...");
		end
	elseif(e.message:findi("belt")) then
		e.self:Say("Oh, yes, I like making belts! They are easy! All I need is a bear skin and 5 gold pieces. The bear skin doesn't have to be that great but don't bring me a ruined one. The gold was my brother's idea.. sorry.");
	elseif(e.message:findi("boot")) then
		e.self:Say("I know how to make boots. Um.. I don't like them as much as belts. They are harder to make. You have to get me a medium quality bear skin and give me 15 gold pieces if you want some bear boots. They are really good, though. At least that is what Baobob tells me.");
	elseif(e.message:findi("talym")) then
		e.self:Say("Talym...  umm...  He is a good source of hides...  He is wanted by the...  umm...  Protectors of the...  um... Pine.");	
	elseif(e.message:findi("mammoth")) then
		e.self:Say("Ooh! Umm. Mammoth! He is a big bear. Bigger than others...  He is living in Surefall Glade. Um...  Bring me his hide.  It would be worth a lot.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.";

	-- Confirmed Live Faction and Experience	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13752, gold = 21},1,text)) then
		e.self:Say("Oh, good! I can make you a nice new cloak now. Here. Here. Oh, this.. it is a good one. Nice bear fur. Here you go!");
		e.other:Faction(e.self,345,2,0); -- Karana Residents
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Priests of Life
		e.other:QuestReward(e.self,{itemid = 2902,exp = 50}); -- Item: Bear-hide Cape
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13751, gold = 15},1,text)) then
		e.self:Say("Ohh good.. good! I.. um.. can make.. Oh great. Here you go. I hope you like it. I always um.. try my best. Tell your um.. friends where you got your bear things!");
		e.other:Faction(e.self,345,2,0); -- Karana Residents
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Priests of Life
		e.other:QuestReward(e.self,{itemid = 2903,exp = 50}); -- Item: Bear-hide Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13750, gold = 5},1,text)) then
		e.self:Say("Great. Oh, here, now I can make the.. um.. ok.. here. Yes.. good. I love making bear skin belts. Here you go. I hope you like it.");
		e.other:Faction(e.self,345,2,0); -- Karana Residents
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Priests of Life
		e.other:QuestReward(e.self,{itemid = 2904,exp = 50}); -- Item: Bear-hide Belt
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

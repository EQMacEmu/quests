function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("What business do you have here?!! This here is the mine and that means if you ain't a [member of Miner's Guild 628], you'd best be moving on!!");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("cleaner")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- min. amiable didn't work
			e.self:Say("Darn that blasted clockwork cleaner!! No one in Kaladim even knows what it is! They all think it's some kinda rat in armor!! Rat paladins?!! The name fits. We miners have seen many like it in the gnome city during heists, err.. visits. We have to get rid of this one in Kaladim!! If you smash it and get its scrap metal, I am authorized to give you a mining cap, if you are a member of Miner's Guild 628.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("628")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Requires amiable on live	
			e.self:Say("Well, then, get off yer rump and give us a hand! If you don't have a mining pick, then get down there and use your fingernails!! If you're new and you want to earn a pick, you can [volunteer to exterminate the rats] that have been infesting the mines!!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("volunteer")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Requires amiable on live	
			e.self:Say("Well, someone has to do the dirty work around here. Let it be you new miners. Go patrol the mines and if you see any rats, bash them good!! Return to me with four rat pelts and I will give you some armor as payment. If you want a 628 mining cap, yer gonna have to smash that infernal [cleaner]!!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("run")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Requires amiable on live	
			e.self:Say("Well, as you most likely know, we are a non-profit organization, at least here in Kaladim. We need to make our profit elsewhere and that means a little bit of thieving. Presently we need loyal members to [collect the gnome profit].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	elseif(e.message:findi("collect")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- Requires amiable on live	
			e.self:Say("Take this key. Don't lose it!! You will need to use it on a metal rat called a scrubber. They are all over Ak'Anon. You must find the one that responds to the number, '628'. If it responds, use the key on it. It will hand over a bag with the 'gnome take'. Return it to me. Get moving!!");
			e.other:SummonCursorItem(12164); -- Scrubber Key
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		else
			e.self:Say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "What are you?! Some kinda' slacker?! I told you to return with FOUR rat pelts!";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13054, item2 = 13054, item3 = 13054, item4 = 13054},1,text)) then -- Giant Rat Pelt
		e.self:Say("It's about time you managed to smash these four!! Here. You do good work. We could use someone like you to [run to the gnome city].");
		e.other:Faction(e.self,322, 20); -- Miners Guild 628
		e.other:Faction(e.self,223, -1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,379, -1); -- Butcherblock Bandits
		e.other:Faction(e.self,241, 1);  -- Deeppockets
		e.other:Faction(e.self,244, -3); -- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124),4000); -- Item(s): Small patchwork and small tattered set -- verified live xp
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13282})) then -- Scrap Metal
		e.self:Say("Great work!! We need this junk for something and we sure didn't need this rat sucking up any of our gems. Here. This is a Mining Cap 628. It's not much, but it is the mark of our miners and provides light for mining purposes. Hold onto it. You never know when we may call upon you to produce it.");
		e.other:Faction(e.self,322, 15); -- Miners Guild 628
		e.other:Faction(e.self,223, -1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,379, -1); -- Butcherblock Bandits
		e.other:Faction(e.self,241, 1);  -- Deeppockets
		e.other:Faction(e.self,244, -2); -- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,12165,5000); -- Miners Cap 628
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12167})) then -- Gnome Take (Bad)
		e.self:Say("What is all this junk!! That blasted tin rat is supposed to be heisting expensive goods from rich gnomes - not all this garbage!! Here. This is your cut of this junk.");
		-- verified live faction
		e.other:Faction(e.self,322, 5); -- Miners Guild 628
		e.other:Faction(e.self,223, -1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,379, -1); -- Butcherblock Bandits
		e.other:Faction(e.self,241, 1);  -- Deeppockets
		e.other:Faction(e.self,244, -1); -- Ebon Mask
		e.other:QuestReward(e.self,0,math.random(5),0,0,eq.ChooseRandom(10009,10015,10500,13220,10500,10016),5000);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12162})) then -- Gnome Take (Good)
		e.self:Say("Good work miner. This is a fantastic haul!! Those wrinkly little gnomes don't know what is going on. Here is your cut. Now get back to work.");
		-- verified live faction
		e.other:Faction(e.self,322, 25); -- Miners Guild 628
		e.other:Faction(e.self,223, -1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,379, -1); -- Butcherblock Bandits
		e.other:Faction(e.self,241, 1);  -- Deeppockets
		e.other:Faction(e.self,244, -3); -- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10005,10038,10017,10020,10006,10320),5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
	    e.self:Say("I am working on it, Mater!!");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

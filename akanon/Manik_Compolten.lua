function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, young one. I am Manik Compolten, High Watchman. Are you a [new warrior] or an [experienced fighter]?");
	elseif(e.message:findi("new warrior")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("It is always good to see new blood amongst the Gemchoppers. I have a small task for you. Take this keycard. I will give you only one at a time. Use each to obtain blackboxes for the C series clockworks. I am sure you are familiar with the clockworks. When you are done, bring them all to me. Let me know if you need another keycard.");
			e.other:SummonCursorItem(13844); -- Item: Shiny Card
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif(e.message:findi("another keycard")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Here. Remember, I will give you only one keycard at a time. These keycards only work for the C series clockworks.");
			e.other:SummonCursorItem(13844); -- Item: Shiny Card
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif(e.message:findi("experienced fighter")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Good. I require your talents to destroy rogue clockworks. After we sent the clockworks to destroy the Asylum of the Mad we found some of the clockworks went haywire and never returned. We must destroy them, not for the safety of the people, but to keep our technology from falling into the hands of any other nation. Go to the Steamfont Mountains and return their rogue blackboxes to me.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		else
			e.self:Say("You are lucky I do not cut you in half right where you stand. Your actions so far have proven you an enemy to the Gemchoppers. Leave while you still can!");
		end
	elseif(e.message:findi("clockwork")) then
		e.self:Say("The clockworks were developed by the Eldritch Collective. They are used as our policing force in Ak'Anon. They come in many series. The letter following their number is the series model.");
	elseif(e.message:findi("blackbox")) then
		e.self:Say("All the clockworks contain blackboxes. These are not containers for items, but rather containers of data of all the clockwork's experiencees. The data can only be extracted by using a blackbox definer.");
	elseif (e.message:findi("red 5")) then
		e.self:Say("Red 5 is the infernal clockwork once owned by the mad gnome, Meldrath. I hear he has survived the scrap heap and is active once more. I offer a reward to all gnome warriors for the return of Red 5's Blackbox. Perhaps even the reward of a [Bull Smasher].");
	elseif (e.message:findi("bull smasher")) then
		e.self:Say("The war hammer, Bull Smasher was crafted by our great blacksmiths and tinkers. It is not magical, but it is weighted to perform for only the short of stature. Certainly an item like Bull Smasher could only be crafted by gnomes.");
	elseif (e.message:findi("meldrath")) then
		e.self:Say("Meldrath is the mad gnome.  He used to be a member of the Eldritch Collective.  Some say he lost his mind while he was working on a formula he obtained from other worlds.  He used to lead the cult called the [Asylum of the Mad].");
	elseif (e.message:findi("asylum")) then
		e.self:Say("The Asylum of the Mad was formed by the mad gnome, Meldrath. Under his direction, they were trying to build some giant mechanical titan.  We recently sent all of our clockworks into the Steamfont Mountains to destroy their evil cult.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Only two blackboxes shall prove your worth to this hall.";
	local text1 = "There are a total of four C series clockworks.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13208,item2 = 13208},1,text)) then
		e.self:Say("Excellent work! You were born to be a warrior. Here is a little bonus for the good job.");
		-- confirmed live faction
		e.other:Faction(e.self,255,5,0); 	-- gem choppers
		e.other:Faction(e.self,333,1,0); 	-- King ak'anon
		e.other:Faction(e.self,288,1,0); 	-- Merchants of Ak'Anon
		e.other:Faction(e.self,1604,-1,0); 	-- Clan Grikbar
		e.other:Faction(e.self,238,-1,0); 	-- Dark Reflection
		e.other:AddEXPPercent(15,1); -- 15% xp at level 1
		e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5)); 
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13212, item2 = 13211, item3 = 13213, item4 = 13214},1,text1)) then
		e.self:Say("Ah!! I see you had no problem finding all of the C series clockworks. Good work. Here. Take this blackbox. We received it from Clockwork 27C. Take it to Jogl Doobraugh. He is the operator of the only blackbox definer in Ak'Anon. He is out at the windmills checking on their operation.");
		-- confirmed live faction
		e.other:Faction(e.self,255,1,0); 	-- gem choppers
		e.other:Faction(e.self,333,1,0); 	-- King ak'anon
		e.other:Faction(e.self,288,1,0); 	-- Merchants of Ak'Anon
		e.other:Faction(e.self,1604,-1,0); 	-- Clan Grikbar
		e.other:Faction(e.self,238,-1,0); 	-- Dark Reflection
		e.other:AddEXPPercent(12,1); -- 12% xp at level 1
		e.other:QuestReward(e.self,0,0,0,0,13209);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13215},0)) then
		e.self:Say("This is fabulous news!! You have done well, young one. Once you are ready for [further instruction] please let me know, I will guide you through your early most dangerous days. When you have become more experienced in our art, I wil be able to further instruct you on how to progress through your early ranks, as well as in some various [trades] you will have available to you.");
		-- confirmed live faction.
		e.other:Faction(e.self,255,10,0); 	-- gem choppers
		e.other:Faction(e.self,333,2,0); 	-- King ak'anon
		e.other:Faction(e.self,288,2,0); 	-- Merchants of Ak'Anon
		e.other:Faction(e.self,1604,-2,0); 	-- Clan Grikbar
		e.other:Faction(e.self,238,-1,0); 	-- Dark Reflection
		e.other:AddEXPPercent(14,1); -- 14% xp at level 1
		if(math.random(100) < 20) then
			e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5),0,eq.ChooseRandom(13219,13220));
		else
			e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5),0,eq.ChooseRandom(1013, 1018, 1015, 1019, 1022, 1023, 1024, 1017, 1016, 1020, 1014, 1021));
		end		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

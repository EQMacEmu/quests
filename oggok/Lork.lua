function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You " .. e.other:GetCleanName() .. ". We hear of you. We need help. You [help Crakneks] or you [help self]?");
	elseif(e.message:findi("help crakneks")) then
		if(e.other:GetFactionValue(e.self) >= 100) then 
			e.self:Say("Ha!! We hear of great adventurer. You?!! Me no think so. You prove self to Crakneks before you help us. Go to Innoth.. Innotu.. Innooth.. Arghh!! You go to outside Oggok. Find fat alligator bit Lork brother in two. Bring brother, Nork, body back. Then me know you strong.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You help Crakneks more. Helps Horgus you must.  Den we trusts yoo!");
		else
			e.self:Say("Me smell the blood of Craknek enemy. Hey! It you!");	
		end
	elseif(e.message:findi("help self")) then
		e.self:Say("You help self to leave Oggok before me bash you. We no need cowards.");
	elseif(e.message:findi("uglan")) then
		if(e.other:GetFactionValue(e.self) >= 100) then 
			e.self:Say("Uglan brave warrior of Oggok. He now in Neriak. Work for dark elves. He NO LIKE dark elves!! He work because we make him. He spy for Crakneks.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You help Crakneks more. Helps Horgus you must.  Den we trusts yoo!");
		else
			e.self:Say("Me smell the blood of Craknek enemy. Hey! It you!");	
		end
	elseif(e.message:findi("help self")) then
		e.self:Say("You help self to leave Oggok before me bash you. We no need cowards.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "This one dead. Where other? Lork say Crushbone heart and Oggok heart.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20523})) then
		e.self:Say("Ay danks. Take dis to Uglan.");
		e.other:QuestReward(e.self,0,0,0,0,16547);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13356})) then
		e.self:Say("Ahhh!! Boohoohoo. Nork!! That you arm. Me will take care of you now. Thank you for killing gator. You must be strong. Now you help Crakneks. We hear.. ohh, poor Nork, we hear trouble begins. Find ogre warrior [Uglan]. Give him this. It broken. He know where you from. Go. Nork.. Poor Nork.");
		e.other:Faction(e.self,232,10); -- Faction: Craknek Warriors
		e.other:Faction(e.self,228,1); -- Faction: Clurg
		e.other:Faction(e.self,261,-1); -- Faction: Green Blood Knights
		e.other:QuestReward(e.self,0,0,0,0,13357,500);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18840})) then
		e.self:Say("What this!! So, dark elves think they can bash ogres. Replace with blue orcs. Dumb Zulort friend with dark elf ambassador in Oggok. We kill him. We kill Crushbone dark elf ambassador also. This slow down plan. We need a hero. Me guess you do. You go. Go bring Lork both Crushbone and Oggok dark elf hearts. Then you be hero.");
		e.other:Faction(e.self,232,10); -- Faction: Craknek Warriors
		e.other:Faction(e.self,228,1); -- Faction: Clurg
		e.other:Faction(e.self,261,-1); -- Faction: Green Blood Knights
		e.other:QuestReward(e.self,0,0,7,0,eq.ChooseRandom(5030,6021),500);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13358, item2 = 13227},1,text)) then
		e.self:Say("That show dark elves who strongest. Me hope you kill many blue orcs. You Craknek Hero now. You take this. It mine. Hero reward. You great ogre now. Smash best.");
		e.other:Faction(e.self,232,25); -- Faction: Craknek Warriors
		e.other:Faction(e.self,228,3); -- Faction: Clurg
		e.other:Faction(e.self,261,-3); -- Faction: Green Blood Knights
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(13359,13355,2136,2130,2135,2132,2128),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

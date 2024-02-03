function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then -- verified faction amount
			e.self:Say("Why, hello there, " .. e.other:GetCleanName() .. "! I am Jusean, loyal member of the League of Antonican Bards. You look like the reliable sort, maybe you could help me out for a bit, huh? It's about time for our field agents to turn in their [watch reports], and I need someone to go pick them up for me.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");	
		end
	elseif(e.message:findi("watch report")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("We always have someone stationed on watch duty at the two main entries to the city to keep an eye on what is happening around Qeynos. We have [Anehan and Behroe] down at the docks, and [Leanon and Quinon] working the North Gate.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");	
		end
	elseif(e.message:findi("anehan and behroe")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Here, if you take this to Anehan or Behroe down at the docks, and then return their report to me as soon as you can, I will give you a small reward.");
			e.other:SummonCursorItem(18021); -- Item: Juseans Report Request
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");	
		end
	elseif(e.message:findi("leanon and quinon")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Leanon is in charge of the day shift at the North Gates of Qeynos, and Quinon is stationed there during the night. Please take this to either of them, have them fill it out, and then return it to me as soon as you can.");
			e.other:SummonCursorItem(18020); -- Item: Juseans Report Request
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");	
		end
	elseif(e.message:findi("father")) then
		if(e.other:GetFactionValue(e.self) >= -200) then			
			e.self:Say("My father Heltin disappeared while on a voyage aboard the Sea King. A group of troll pirates attacked and boarded the ship. Ginleen Harltop and the steel warriors traveling with them managed to fight them off, but took many casualties. My father was one of the bodies that was not accounted for. They found his song book floating in the water near the boat. The red water soaked through it's pages told more of the story then I ever care to know.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");	
		end
	elseif(e.message:findi("flute")) then
		if(e.other:GetFactionValue(e.self) >= -200) then			
			e.self:Say("Sorry, I'm not in the flute-making business anymore.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");	
		end
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Emote("growls, revealing his fangs.");
	end
end


function event_trade(e)
	local item_lib = require("items");
	local item_check = 0;

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18023})) then
		e.self:Say("Good job. I hope Behroe wasn't sleeping on the job again when you talked to him. Hmm, the docks seem to be a hotbed of activity after the sun goes down. Thanks for your quick work, " .. e.other:GetCleanName() .. ", here's a little cash for your efforts.");
		item_check = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18024})) then
		e.self:Say("Ah, very good. I'll make sure to note Leanon's report in our journals. Here's a little something for your troubles, " .. e.other:GetCleanName() .. ".");
		item_check = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18022})) then
		e.self:Say("Ok, good work, " .. e.other:GetCleanName() .. ". I'll make sure to note the day's activities in our journal. Here's a little something for your efforts.");
		item_check = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18025})) then
		e.self:Say("Hmm... interesting...  good work, " .. e.other:GetCleanName() .. ", thank you for your help.");
		item_check = 2;
	end
	
	-- live confirmed text + faction
	if(item_check == 1 or item_check == 2) then
		
		if(item_check == 1) then
			e.other:Faction(e.self,284,25,0); -- league of antonican bards
			e.other:Faction(e.self,281,3,0); -- knights of truth
			e.other:Faction(e.self,262,3,0); -- guards of qeynos
		elseif(item_check == 2) then
			e.other:Faction(e.self,284,10,0); -- league of antonican bards
			e.other:Faction(e.self,281,1,0); -- knights of truth
			e.other:Faction(e.self,262,1,0); -- guards of qeynos
		end
					
		e.other:Faction(e.self,304,-1,0); -- ring of scale
		e.other:Faction(e.self,285,-1,0); -- mayong mistmoore
		e.other:QuestReward(e.self,math.random(10),0,0,0,0,50);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I'm looking for an accomplished soldier to help me carry out a very dangerous mission. If you know of one please have them report to me at once.");
	elseif(e.message:findi("soldier")) then
		e.self:Say("Very well, acquire a chest of valor and fill it with the medals you receive from scouts Husman, Danarin, and Derin. Give me the resulting soldier's chest and I will reveal the details of my mission.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 4397}, 0) ) then -- Soldier's Chest
		e.self:Say("Take this map and study it carefully. The mission we are preparing to embark upon will make your previous raids seem like child's play. Many friendly forces will need to help us to achieve our objectives, two dozen soldiers as powerful as me to be exact. When you have selected and briefed the troops that will carry out the offensive, give me the map and I will lead the assault.");
		e.other:QuestReward(e.self,0,0,0,0,4398); -- Map of Grimling Forest
		
	elseif ( item_lib.check_turn_in(e.self, e.trade, {item1 = 4398}, 0) ) then -- Map of Grimling Forest
		e.self:Say("Form up and follow me, I have an officer meeting us just outside the outpost. I'll finish briefing you all there.");
		e.other:QuestReward(e.self,0,0,0,0,0,50000);
		eq.unique_spawn(167689, 31, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Captain_Necin
		eq.unique_spawn(167691, 0, 0, -489, -1075, 3.5, 224); -- #Sergeant_Jherum
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_say(e)
	if(eq.is_the_scars_of_velious_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Emote("appears to be ignoring you completely.");
		elseif(e.message:findi("audience with the overlord")) then
			e.self:Say("The Overlord is not seeing anyone at this time, however, I may have work for you. You seem to have some experience with the kobold annoyance in the region. Are you [interested]. " .. e.other:GetCleanName() .. "?");
		elseif(e.message:findi("interested")) then
			e.self:Say("Then I shall give you a task. I assume you are aware of the kobold lair nearby. Many of our adventurous knights and priests crusade to destroy those pests so seeing many Erudites frequent the area is normal. However, it is not normal to see someone carry large crates into the lair and return empty handed. This person's movements also show he is attempting to remain unseen.....the [fool].");
		elseif(e.message:findi("fool")) then
			e.self:Say("Whoever it is, obviously is not an Erudite, even though he appears to be. Only an outsider would take us to be such idiots as to fall for their pitiful attempt at disguise. Or perhaps....well, never mind that. I want you to enter the kobold lair and find these crates. Return one to me and we'll decide what to do from there.");
		elseif(e.message:findi("important task")) then
			e.self:Say("According to the evidence we've uncovered, it appears the kobolds are nothing but pawns to harass us. Or perhaps even all of Odus. If they wish to play these games, then we'll humor them. We'll take their pawn with one of our knights. Will you be the knight, " .. e.other:GetCleanName() .. "?");
		elseif(e.message:findi("knight")) then
			e.self:Say("Then you will deliver this chest for us. Don't worry about what's inside it. Although we enjoy our solitude, we do make allies. We also make use of those allies. We will do so now. Take the chest to Lyris Moonbane below the human city of Qeynos. You will then follow her instructions and complete any tasks she assigns you. In return, she will send you back with what we wish. Fear is our armor.");
			e.other:SummonCursorItem(1792); -- Heavy Locked Chest
		end
	else
		if(e.message:findi("hail")) then
			e.self:Emote("appears to be ignoring you completely.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Is this it? I asked for the head of the courier, the head of the supplier, a full box of ore, and evidence from the supplier. Do not return until you have all of these!";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1773})) then--Large Empty Crate
		e.self:Say("Hmmm. Very odd. The dust in the crate implies some sort of stone was transported in it. Perhaps our brothers of the Arcane will be able to find out where this dust came from and what it?s used for. Take this dust sample and note to Keletha Nightweaver. She will examine the dust and send you back with a report. Make haste.");
		e.other:QuestReward(e.self,0,0,0,0,1774,137180);--Envelope with dust sample
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1775})) then--heretics report
		e.self:Emote("'s eyes redden with intense anger after reading the report. When he speaks, his voice is suprisingly calm and measured. He says, 'Listen close " .. e.other:Race() .. ". When you leave this building, you will find the courier who is bringing the ore. You will kill him, and collect his head and a box of the ore. You will then find the supplier, and collect his head and any other information you find on him. Bring me these four things and you will be rewarded. Do not fail.'");
		e.other:QuestReward(e.self,0,0,0,0,0,137180);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1776, item2 = 1777, item3 = 18174, item4 = 1778},1,text)) then--crate of ore,couriers head,suppliers head,sealed letter
		e.self:Say("Honestly " .. e.other:GetCleanName() .. ", I thought you would not return. Such strength and intelligence in a Knight of Fear I have not seen for quite some time. Wear this in pride of the ancient Ridossan. Perhaps when you are ready, I will give you a more [important task]. This conspiracy must be stopped.");
		e.other:Faction(e.self,265,20);  -- +Heretics
		e.other:Faction(e.self,242,-20);  -- -Deepwater Knights
		e.other:Faction(e.self,254,-20); -- -Gate Callers
		e.other:Faction(e.self,231,-20);  -- -Craftkeepers
		e.other:Faction(e.self,233,-20);  -- -Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,1764,137180);--Leggings of Ridossan
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1892})) then-- Empty Jar
		e.self:Say("Well done, " .. e.other:GetCleanName() .. "! Now we need only wait for the kobolds to start dying off and our plan will be complete. Should only take 8 years or so. One such as yourself will wear this ancient armor well. The Tunic of the crusader Rodossan is now yours.  He shall watch over and praise you in your triumphs... your defeats on the other hand... well, never mind that.");
		e.other:Faction(e.self,265,40);  -- +Heretics
		e.other:Faction(e.self,242,-40);  -- -Deepwater Knights
		e.other:Faction(e.self,254,-40); -- -Gate Callers
		e.other:Faction(e.self,231,-40);  -- -Craftkeepers
		e.other:Faction(e.self,233,-40);  -- -Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,1765,137180);--Tunic of Ridossan
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

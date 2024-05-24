function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There is little time for talk. There are plenty of [tiny invaders]. Do your part and exterminate as many as you can. All of Cabilis shall look favorably upon you in the long run.");
	elseif(e.message:findi("tiny invaders")) then
		e.self:Say("The small scorpions have been turning up everywhere!! One can hardly sleep when thinking of the little monsters. Please crush as many as you can for the greater good. I will even pay a bounty for every four Scorpion Pincers you return.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "The bounty is awarded to one who can return four scorpion pincers.";
	
	if(e.other:GetFaction(e.self) < 6) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12650, item2 = 12650, item3 = 12650, item4 = 12650},1,text)) then --Handin: 4x Scorpion Pincers
			e.self:Say("Magnificent!! The more pincers I get the lesser scorpions there are. Here. Take the bounty.");
			-- confirmed live faction and experience reward
			e.other:Faction(e.self,441,3);  -- +Legion of Cabilis
			e.other:Faction(e.self,440,1);   -- +Cabilis Residents
			e.other:Faction(e.self,445,1);  -- +Scaled Mystics
			e.other:Faction(e.self,442,1);   -- +Crusaders of Greenmist
			e.other:Faction(e.self,444,1);  -- +Swifttails
			e.other:QuestReward(e.self, {copper = math.random(0,5),silver = math.random(0,5),exp = 2500});
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18213})) then
			e.self:Say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this box. Your task is to seek milita skeletons near this gate. Apparently, someone or something has been raising militia corpses and they now walk the land not knowing the difference between friend or foe. They even continue using their old call, 'Halt Who goes there?'. Fill and combine within the box their charred bone shards and return the filled box to me for your geozite tool.");
			e.other:QuestReward(e.self,0,0,0,0,17996);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12668})) then
			e.self:Say("Very fine work, young " .. e.other:GetCleanName() .. ". You will make a fine trooper, should you survive long enough. As promised, here is your geozite tool. Be sure to visit the legion weaponsmith to learn how to use it. Farewell.");
			e.other:Faction(e.self,441,5);  -- +Legion of Cabilis
			e.other:Faction(e.self,440,1);   -- +Cabilis Residents
			e.other:Faction(e.self,445,1);  -- +Scaled Mystics
			e.other:Faction(e.self,442,1);   -- +Crusaders of Greenmist
			e.other:Faction(e.self,444,1);  -- +Swifttails
			e.other:QuestReward(e.self,0,0,1,0,12657,1000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -100) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello there, " .. e.other:Race() .. ". I am Slaggak, the trainer. The Kromrif here will soon be ready to serve the great and honorable King Tormax.");
		elseif(e.message:findi("serve")) then
			e.self:Say("So you say, little one. Why are you here, then? You should be out slaying those pestering little Coldain or maybe those damnable shard wurms and wyverns.");
		elseif(e.message:findi("coldain")) then
			e.self:Say("The Coldain are the ice dwarves. They have defiled our lands for long enough. Thinking of them makes my blood run hot. With my new position as trainer, I am not allowed to roam the lands and slaughter their kind as I once did.' Slaggak sighs. 'I long for the days when I could fashion necklaces from their skulls.");
		elseif(e.message:findi("shard wurm")) then
			e.self:Say("You must have seen the shard wurms by now! The lizards that roam the lands eating whatever they can find? They can grow to be quite ferocious! Not nearly as ferocious as their ancient cousins, the dragons, but a nuisance nonetheless. We have a bounty on those beasts here in Kael Drakkel.");
		elseif(e.message:findi("skull")) then
			e.self:Say("Go from here and seek out the Coldain, slay them, and return to me with their heads. I wish to fashion four skull talismans as I once did. If you can do this for me, I will surely let King Tormax know of your deeds and reward you with a piece of armor from the Militia armory.");
		elseif(e.message:findi("bounty")) then
			e.self:Say("If you think you have what it takes to slay the shard wurms or their relatives, the wyverns, bring back proof of your exploits. For every four shard wurm fang you bring me, I am authorized to reward you with a pair of cerulean greaves. Every fourth ice wyvern stinger will grant you a pair of vambraces.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 7) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30081,item2 = 30081,item3 = 30081,item4 = 30081}, 0)) then
			e.self:Emote("looks down at you as you hold up the skulls of the wretched little dwarves.  'Excellent work, " .. e.other:GetCleanName() .. ".  Here is your reward as promised.  A piece of prize armor crafted for war.");
			e.other:Faction(e.self,419,40); -- Faction: Kromrif
			e.other:Faction(e.self,448,10); -- Faction: Kromzek
			e.other:Faction(e.self,406,-20); -- Faction: Coldain
			e.other:Faction(e.self,430,-4); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(25011, 25016, 25013, 25010, 25017, 25014, 25007, 25005, 25015, 25009, 25006, 25012, 25018),50000);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25100,item2 = 25100,item3 = 25100,item4 = 25100}, 0)) then
			e.self:Say("Excellent work, " .. e.other:GetCleanName() .. ".  Here is your reward as promised. A piece of prize armor crafted for war.");
			e.other:Faction(e.self,419,40); -- Faction: Kromrif
			e.other:Faction(e.self,448,10); -- Faction: Kromzek
			e.other:Faction(e.self,406,-20); -- Faction: Coldain
			e.other:Faction(e.self,430,-4); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,0,25071,50000);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25101,item2 = 25101,item3 = 25101,item4 = 25101}, 0)) then
			e.self:Say("Excellent work, " .. e.other:GetCleanName() .. ".  Here is your reward as promised. A piece of prize armor crafted for war.");
			e.other:Faction(e.self,419,40); -- Faction: Kromrif
			e.other:Faction(e.self,448,10); -- Faction: Kromzek
			e.other:Faction(e.self,406,-20); -- Faction: Coldain
			e.other:Faction(e.self,430,-4); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,0,25070,50000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

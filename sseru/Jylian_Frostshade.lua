-- Jylian's Research

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, as you can see I am quite busy with my [research]. If you don't mind I need silence to concentrate.");
	elseif(e.message:findi("research")) then
		e.self:Say("I am researching what went wrong in Mons Letalis. The spires constructed there should allow us passage back to Norrath freely. Upon completion of them something [went wrong].");
	elseif(e.message:findi("went wrong")) then
		e.self:Say("Suddenly the spires were overwhelmed with eerie beings that seemed to have no essence to them. These spirits now plague the spires. Due to our lack of knowledge of these creatures we do not know how to deal with them. Fighting them seems useless because as soon as one is destroyed more would materialize. They seemed to feed off of death, especially ours. We must [find out more] about them.");
	elseif(e.message:findi("find out more")) then
		e.self:Say("If you think you can help, I charge you with the task of gathering information. Seek out these creatures, and if you can manage to destroy them bring me their robes. I will study the garment to see if I can determine its origin. Now please, leave me be so that I can get to my research.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29865}, 0)) then
		e.self:Emote("delicately removes one of the embroidered symbols from the fading robe. Jylian then begins to weave spells to the robe until it becomes fully materialized. 'These robes have unusual symbols all about them. I must study this symbol in greater detail. Here you can have this robe, I have placed an enchantment on it to keep it from fading from this plane of existence any further. Your service to Seru is appreciated. Now go, I need silence to concentrate.'");
		e.other:Faction(e.self,1499,10); -- Citizens of Seru
		e.other:Faction(e.self,1484,1); -- Hand of Seru
		e.other:Faction(e.self,1486,1); -- Heart of Seru
		e.other:Faction(e.self,1485,1); -- Eye of Seru
		e.other:Faction(e.self,1487,1); -- Shoulders of Seru
		e.other:Faction(e.self,1502,-5); -- Katta Castellum Citizens
		e.other:QuestReward(e.self,0,0,0,0,29890,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


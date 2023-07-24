function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- not sure of exact faction, responds between 0 and Scowls
			e.self:Say("Hail, " .. e.other:GetCleanName() .. "! I hope the trek into our shrine has not scarred you in any way. Our defenses have been increased lately. Many of the citizens have heard rumors about our shrine. I say it is all due to that [soldier].");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");
		end
	elseif(e.message:findi("soldier")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The soldier I refer to is Commander Kane Bayle. The supreme officer himself. Don't get me wrong. I trust Kane. He has quite a black heart. I just don't trust that girl, [Nerissa].");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");
		end
	elseif(e.message:findi("nerissa")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Nerissa Clothspinner. Her sister was a good friend of Kane's. When she left Qeynos to venture into the world, she asked Kane to watch over the girl. Now Kane tries to hide from this child the fact that he is allied with our church. I do not think he has hidden it well. I have told the others. but they do not believe me. I do not care. I have my own [plans].");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");
		end
	elseif(e.message:findi("plan")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Nerissa is well protected by Kane. She will no doubt attempt to inform someone of her suspicions, most likely her sister, Milea. You must find Milea Clothspinner and kill her. No word of our operations must leak out. Return with proof of Milea's death and we shall see to a reward.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("While the Bloodsabers appreciate your past contributions to Bertoxxulous and our cause, we do not feel you can be trusted with vital information yet.");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13302}, 0)) then
		e.self:Say("You have done a truly wicked deed. Good work! Milea was a prestigious member of the Hall of Steel and a friend to the Knights of Truth. It is better that she now fertilizes the flowers of the Plains of Karana. Here. A fitting reward for such a deed.");
		e.other:Faction(e.self,221,10); --Bloodsabers
		e.other:Faction(e.self,262,-1); --Guards of Qeynos
		e.other:Faction(e.self,296,1); --Opal Dark Briar
		e.other:Faction(e.self,341,-2); --Priest of Life
		e.other:Faction(e.self,230,1); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,{exp = 1000})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, small one! You should not waste your time in the safety of the troopers' patrols. Go forth into the land and earn your stripes in battle. Become a greater asset to the Iksar empire.");
	elseif(e.message:findi("thieves")) then
		e.self:Say("Never mind how the book was taken, just go find the goblin thieves that did the deed."); --not live text
	elseif(e.message:findi("trooper reporting for duty")) then
		e.self:Say("Welcome to my garrison, Trooper " .. e.other:GetCleanName() .. ". Lucky for you that you do not serve the inferior swamp garrison. They lose more troopers than any legion unit. You have come just in time. We need you to take this pack and fill it with goblin warlord warbeads. Combine the beads in the pack and return it to me.");
		e.other:SummonCursorItem(17042); -- Item: Woods Garrison Pack
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18210})) then
		e.self:Say("I am glad to see they have sent a strong new recruit. I have a task for you which will require you to recover a few pages of a certain poem I once wrote. I never should have written of such weak-minded things, but the pages were stolen from me before I could destroy them. Take this poem binder and find the [thieves]. When you combine the pages in the binder, it will magically lock and you may return it to me for your prize, the geozite tool.");
		e.other:QuestReward(e.self,0,0,0,0,17995);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12667})) then
		e.self:Say("Great work!! You have saved me from disgrace. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one.");
		e.other:Faction(e.self,440,5); -- Faction: Cabilis Residents
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:Faction(e.self,445,1); -- Faction: Scaled Mystics
		e.other:Faction(e.self,444,1); -- Faction: Swift Tails
		e.other:Faction(e.self,442,1); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,1,0,12657,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12912})) then
		e.self:Say("Great job, Trooper " .. e.other:GetCleanName() .. ". Such a warrior would serve the empire better as a legionnaire and not a trooper. I shall recommend you for the rank of legionnaire.");
		e.other:Faction(e.self,440,2); -- Faction: Cabilis Residents
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:Faction(e.self,445,2); -- Faction: Scaled Mystics
		e.other:Faction(e.self,444,2); -- Faction: Swift Tails
		e.other:Faction(e.self,442,2); -- Faction: Crusaders of Greenmist
		e.other:QuestReward(e.self,0,0,0,0,18072,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

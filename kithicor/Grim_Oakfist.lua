function event_say(e)
	if((e.other:GetFaction(e.self) < 5) and (e.self:GetClass() == 7)) then
		if(e.message:findi("hail")) then
			e.self:Say("It is good to finally meet one who respects the disciplines of the Ashen Order.  All I have met are rangers.  They have interfered with my [mission in the woods].");
		elseif(e.message:findi("mission in the wood")) then
			e.self:Say("I have come here to avenge my family.  One season past, they were attacked by a trio of deadly tigers.  I came here to hunt the beasts down, but then I found the local rangers and residents here protect the tigers.  They seem to be legends in these parts.  The tigers even have name's!!  They call them Eenot, Reggit and Kobb.  I wish I had help from a [fellow monk].");
		elseif(e.message:findi("fellow monk")) then
			e.self:Say("Good!! The rangers are watching me so you must go alone.  I can only wait until the morning, then I must go.  If you find all three tigers, return their pelts to me and I shall reward you with something discovered for monks only.");
			eq.unique_spawn(20276, 0, 0, 4184, -745, 548); -- Spawn Eenot
			eq.unique_spawn(20277, 0, 0, 1084, -707, 225); -- Spawn Reggit
			eq.unique_spawn(20000, 8, 0, -585, -165, -38); -- Spawn Kobb
		elseif(e.message:findi("treant fist")) then
			e.self:Say("The treant fists were created by great craftsmen.  They are for the fists of a monk and offer greater dexterity and increase the durability of one's soul.  My last pair were given to Master Puab of the Ashen House training grounds.");
			eq.depop_with_timer();
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I asked you to hunt down all three of the tigers.";
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12341, item2 = 12342, item3 = 12343},1,text)) then
		e.self:Say("Good work.  I hope you had no run ins with the local rangers.  Here is my reward.  An object from the past which I found in my journeys.  Wish that I could reward you also with [treant fists].");
		e.other:Faction(e.self,361,10); -- Ashen Order Faction ID-361
		e.other:Faction(e.self,281,1); -- Knights of Truth Faction ID-281
		e.other:Faction(e.self,309,1); -- Silent Fist Clan Faction ID-309
		e.other:QuestReward(e.self,0,0,0,0,12367,5000); -- Collar of Neshika ID-12367
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:kithicor ID:20220 -- Grim_Oakfist
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

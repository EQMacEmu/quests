function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "!  We of the Dead are proud to have you among us.  Your lineage is well known.  Still, you must learn to claw your way to the upper echelon.  There are many [menial tasks] to be performed before you can truly be inducted as a member.");
	elseif(e.message:findi("menial tasks")) then
		e.self:Say("You cannot avoid the toil of peons. We have all spent our time in the lower ranks. There are duties such as [collecting beetle eyes].");
	elseif(e.message:findi("beetle eye")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Take this chest.  It has been fitted with a mold designed to hold ten beetle eyes.  We require them for further experiments.  Do not return until you fill the chest.");
			e.other:SummonCursorItem(17930);--Empty Box
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("other components")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Take this chest. This one must be filled with [Kerra Isle beetle] eyes. When you finish filling the chest, be sure to return to me with a [wooly mammoth] tusk also. Be quick about it and I just may reward you with something special.");
			e.other:SummonCursorItem(17932);--Empty Chest
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("kerra isle beetle")) then
		e.self:Say("The shipping route between Qeynos and Erudin includes a stop on an island filled with friendly catpeople. Also on this isle is the Kerra Isle beetle. It is indigenous to Kerra Isle and the catpeople are very protective of them.");
	elseif(e.message:findi("mammoth")) then
		e.self:Say("I hear that wooly mammoths can be found in the peaks of Everfrost. They are fierce beasts. I would hate to annoy one.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local randomloot = math.random(1,3);
	local text = "I was expecting a mammoth tusk and the combined beetle eye box!";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13389})) then--Box of Beetle Eyes
		e.self:Say("Fantastic work, my child! We shall store these for further experiments. Take this as extra payment for a fine job. You have done so well I believe you can assist in obtaining two [other components].");
		e.other:Faction(e.self,239,10); --The Dead
		e.other:Faction(e.self,303,1); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-1); --King Naythox Thex
		e.other:Faction(e.self,275,-1); --Keepers of Art
		e.other:Faction(e.self,245,-1); --Eldritch Collective
		e.other:Faction(e.self,1522,-20); --Primordial Malice
		if(randomloot == 1) then
			e.other:QuestReward(e.self,{silver = 16, exp = 17150, items = {13021,13022}}) -- Item(s): Neriak Nectar (13021), Rotgrub Rye (13022)
		elseif(randomloot == 2) then
			e.other:QuestReward(e.self,{silver = 16, exp = 17150, items = {13021,13021,13022,13022}})
		elseif(randomloot == 3) then
			e.other:QuestReward(e.self,{silver = 16, exp = 17150});
		end
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13395, item2 = 10124},1,text)) then -- Beetle Eye Chest and Mammoth Tusks
		e.self:Say("Excellent work, young one! You are sure to be an asset to our faction. Let us see if we can help you on your journey to power. I believe this can be of assistance to a young necromancer of the Dead.");
		e.other:Faction(e.self,239,20); --The Dead
		e.other:Faction(e.self,303,3); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-3); --King Naythox Thex
		e.other:Faction(e.self,275,-3); --Keepers of Art
		e.other:Faction(e.self,245,-3); --Eldritch Collective
		e.other:Faction(e.self,1522,-40); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(15035,15362,15445,15355,15360,15363),17150); --Random level 12 Necromancer spell
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42042 -- Noxhil_V`Sek
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

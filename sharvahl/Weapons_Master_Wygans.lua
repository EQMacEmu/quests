function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail friend. welcome to our workshop.  This area once housed the arena's armory. but was converted to a weapons workshop during the initial stages of the war against the Horde.  That was a few years before our time. but Kotahl. Saulgan. and I have been here for at least a decade now.  We've been experimenting with new ways to fight against the Horde.");
	elseif(e.message:findi("horde")) then
		e.self:Say("The Grimling horde erupted from the mines many many years ago. It was like they just came through a hole in the mines or something. Our miners were all slaughtered in a matter of hours. Some of the residents of the mining camp in the forest made it out alive... but only a few. We have been fighting with little sign of progress for decades now, but that was before Kotahl made his discovery!");
	elseif(e.message:findi("discovery")) then
		e.self:Say("Kotahl and Saulgan researched the horde and developed a theory about their origin. Kotahl was able to take those theories and find a way of injuring them by altering the magic of their weapons through alchemy. We have perfected the process and only need the weapons at this point.");
	elseif(e.message:findi("weapons")) then
		e.self:Say("If you meet with our forces in the Grimling Forest and can find a Grimling officer, you may be able to get one of the weapons that we need. Return those weapons to one of us and we can convert its magic to harm its former owner. The weapons come in three styles. I can convert the weapons of the Grunt. Saulgan can convert the weapons of the Horde. Kotahl works on the weapons of the High Grimling. Bring us those weapons and we'll convert them for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7170})) then -- Claw of the Grunt
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7171,300); -- Grimling Bane Claw
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7180})) then -- Dirk of the Grunt
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7181,300); -- Grimling Bane Dirk
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7174})) then -- Great Sword of the Grunt
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7175,300); -- Grimling Bane Great Sword
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7176})) then -- Hammer of the Grunt
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7177,300); -- Grimling Bane Hammer
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7172})) then -- Short Sword of the Grunt
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7173,300); -- Grimling Bane Short Sword
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7178})) then -- Staff of the Grunt
		e.other:Faction(e.self,1513,2); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7179,300); -- Grimling Bane Staff
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

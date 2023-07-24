-- Part of SK Epic 1.0

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ", it's good to see another shadowknight around here. I'm Teydar. I've made it my life to fashion suitable scabbards and sheaths for our order.");
	elseif(e.message:findi("decrepit sheath")) then
		e.self:Say("The object you desire is very difficult to fashion. Nearly impossible, really. All I can offer to do is try. The real difficulty is the contents that give the sheath its power. They have to be of an almost equal evil. I think some kind of decrepit hide and a drake spine, along with a bar of enchanted platinum, should prove enough to make this item.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(  e.other:GetFactionValue(e.self) >= -88) then  -- Faction: True Spirit
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14372, item2 = 14371, item3 = 16507})) then
			e.self:Say("I did it! The pieces you got me were perfect! It took a huge effort on my part to craft this, of course. It saddens me that I'm unable to keep one of my best works, but a deal is a deal. There is honor among shadowknights.");
			e.other:Faction(e.self,404, 5); -- Faction: True Spirit
			e.other:QuestReward(e.self,0,0,0,0,14366);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Shadowknight master me be!!  " .. e.other:GetCleanName() .. " prove to me that " .. e.other:GetCleanName() .. " be worthy to be one with Greenblood and me give " .. e.other:GetCleanName() .. " black shadow tunic.  You [want black shadow tunic]?");
	elseif(e.message:findi("want black shadow tunic")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You hunt lizard scouts. Them sometimes carry special fife to talk to other lizards far away. Greenbloods stop them. Bring Bonlarg three lizard scout fifes and green stained skin tunic you gots when you first talk to Soonog. Give all to Bonlarg and get tunic.");		
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Help Greenbloods you will. Give lizard tails to Grevak.  Den maybe we trust.");
		else
			e.self:Say("Foe of Greenbloods you are. In two I will rip you. Best if run.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Fool! Bonlarg say THREE lizardman scout fifes and green stained skin tunic.";	
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12198, item2 = 12198, item3 = 12198, item4 = 13527},1,text)) then
		e.self:Say("Took you long time! It easy task, but me guess you still earn black shadow tunic. You wear to show all that you young shadowknight. It help you be smarter likes Bonlarg. It only for young Greenblood shadowknight. Maybe later green shadow tunic you earn or maybe dead you be");
		e.other:Faction(e.self,261, 5); -- Faction: Green Blood Knights
		e.other:Faction(e.self,228, 2); -- Faction: Clurg
		e.other:Faction(e.self,312, -1); -- Faction: Storm Guard
		e.other:Faction(e.self,308, -1); -- Faction: Shadowknights of Night Keep
		e.other:QuestReward(e.self,0,0,0,0,12199,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

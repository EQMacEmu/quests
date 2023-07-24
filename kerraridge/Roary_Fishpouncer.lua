function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Rrrr.. catching and prrreparing fish is my specialty. Perrrhaps you could fetch for me some [rrrare fish] so that I may demonstrate my skill? Rrrr.");
	elseif(e.message:findi("rrrare fish")) then
		e.self:Say("Rrrr.. my most delectable dish is prrreparrred frrrom rrraw darkwater piranha. Unforrrtunately. the pirrranha only surrrvives in the murrrky waterrrs of the wicked Nektulos forrrest. I will rrreward any brrrave fisherman who can brrring me some rrraw darkwater pirranha.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Rrrrr... I need both the spear and a frrresh fish to prrrepare the spear with the oil.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12318})) then
		e.self:Say("Rrrr... my mouth is waterrring alrrrready. Ourrr trribe shall feast well tonight. You have prrroven yourself a fisherrrman worrrthy of one of my special spearrrs. They are coated with a specially prrrepared fish oil. When all the oil has washed off, you may rrreturn the spear to me along with a frrresh fish and I will rrreapply the oil for you.");
		e.other:Faction(e.self,382,20); -- Faction: Kerra Isle	
		e.other:QuestReward(e.self,0,0,0,0,7027);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7027, item2 = 13019},1,text)) then -- recharge, kerran fishing spear and fresh fish
		e.self:Say("Rrrr... been doing some deepwater fishing, I presume? Here is your spear with a frrresh coat of my special oil.");
		e.other:QuestReward(e.self,0,0,0,0,7027);
	end
end

--END of FILE Zone:kerraridge  ID:74075 -- Roary_Fishpouncer
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
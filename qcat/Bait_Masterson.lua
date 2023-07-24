function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You know.. I took up fishing because it was a nice, quiet activity. Most of all, I took it up to avoid conversing with strangers. Get the picture?!!");
	elseif(e.message:findi("blessing of prexus")) then
		e.self:Say("Prexus!!? Aye!! I once followed the ways of the Ocean Lord. I remember those days. So clear and peaceful were they. I shall make a deal with you, my friend. I shall give up fishing if you give me your guild tunic. With such a tunic I shall once again be compelled to follow the peaceful ways of the Ocean Lord.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("If I were to donate, it would not be to a temple which follows the Rainkeeper. There is no greater deity than Prexus, the Oceanlord.");				
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13544})) then
		e.self:Say("Nice material!! I feel the ways of Prexus enlightening my soul. Unngh!! Enough of this fishing. Here take my broken fishing pole and toss it to the sea. All hail Prexus!!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,242,5); -- Faction: Deepwater Knights
		e.other:Faction(e.self,266,1); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1); -- Faction: Heretics
		e.other:QuestReward(e.self,0,0,0,0,13922,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:10139 -- Bait_Masterson
-----------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

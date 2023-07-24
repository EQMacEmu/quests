function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Desist in your prattle.  If you want idle chitchat. talk to someone else.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18017})) then -- Fell Blade Guild Note
		e.self:Say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
		e.other:Faction(e.self,265,100); -- Heretics
		e.other:Faction(e.self,242,-100); -- Deepwater Knights
		e.other:Faction(e.self,254,-100); -- Gate Callers
		e.other:Faction(e.self,231,-100); -- Craftkeepers
		e.other:Faction(e.self,233,-100); -- Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,13573,20); -- Blood Splattered Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75111 -- Mandaril_Dark_Knife
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

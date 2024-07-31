--this quest needs to remain ID based because it only applies to this
--specific version of the mob, there are several with this name

-- A skeleton Worker, Overthere
-- This one is indiff to everyone, other ones around are RTA.
-- give hime : spectacles, forsaken pariah mask, Evergreen Ivy Ringband, Green Death Rum
-- Necro skull cap 5, returns A metal key, you have to give it to Tin Banker Assistant

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12848, item2 = 12850, item3 = 12851, item4 = 12610}, 0)) then
		e.self:Emote("takes your hand and guides it into his ribcage. You feel something odd. It is a metal key!!");	
		e.other:QuestReward(e.self,0,0,0,0,12849);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12848}, 0)) then
		e.self:Emote("stops working and begins to open his creaking jaw. 'I live to study and quench my thirst. I live to Bash the Faces of Pariah and entangle myself in the ivy of evergreen. I live. I want to remember.'");
		e.other:QuestReward(e.self,0,0,0,0,12848);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

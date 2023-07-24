-- Al'Kabor's Research - Ring of the Messenger
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. "! I hope you are enjoying your visit to the outpost. I know I sure am.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6067})) then
		e.self:Say("Oh no! I have been tracked down. Can't I have a moment's peace? I'm sorry you went through all the trouble to get this to me, but I'm not delivering mail right now. I'm trying to take a vacation. You'll have to deliver it to Lanivon Baxer in the Toxxulia Forest yourself. Here, take it back. I have packaged it up nicely for the journey.");
		e.other:QuestReward(e.self,0,0,0,0,6069);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

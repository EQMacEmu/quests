-- Al'Kabor's Research - Ring of the Messenger
--

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Safe travels to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6069})) then
		e.self:Say("Excellent work! Thank you for delivering this to me. I will get it to the High Council as soon as possible. Take this Ring of the Messenger as an insignia of your service to the city.");
		e.other:QuestReward(e.self,0,0,0,0,1573,85000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: tox ID: 38064 NPC: Lanivon_Baxer


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

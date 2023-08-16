function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Shrine of the Diseased! You will be repaid for your service when your soul crosses the void into Bertoxxulous' waiting arms. Are you available to [do His bidding], or are you [too busy]?");
	elseif(e.message:findi("do his bidding")) then
		e.self:Say("That is good. We need you to go and speak with [Commander Kane Bayle] of the Qeynos Militia. You will find him at the gatehouse. Tell him that the disease is spreading. Now go.");
	elseif(e.message:findi("Kane")) then
		e.self:Say("Commander Kane Bayle is a new member of the Shrine of Bertoxxulous. He will assist us in turning the city of Qeynos from thunder to plague.");	
	elseif(e.message:findi("too busy")) then
		e.self:Say("Then be off and spread the disease.");	
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:45069 -- Zaen_Kalystir
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
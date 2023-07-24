function event_say(e)
	e.self:Say("Leave before I call the guard. Don't come back, " .. e.other:Race() .. ".");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1797,item2 = 1797,item3 = 1797})) then
		e.self:Say("Ahh wonderful work " .. e.other:GetCleanName() .. " Here is the substance....don't spill it HAHAHAaahhahehehe...yes......you don't want to spill that heheh.");
		e.other:Faction(e.self,221,2,0); -- Bloodsabers
		e.other:Faction(e.self,262,-1,0); -- Guards of Qeynos
		e.other:Faction(e.self,296,1,0); -- Opal Dark Briar
		e.other:Faction(e.self,341,-1,0); -- Priests of Life
		e.other:Faction(e.self,230,1,0); -- Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,1793,2000); -- Putrid substance
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:freportw  -- Driana_Poxsbourne

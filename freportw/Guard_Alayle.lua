function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, citizen! You should not be in the Militia House. These are restricted grounds. Please leave at once unless you have business here.");
	elseif(e.message:findi("truth is good")) then
		e.self:Say("Ssshhh!! Pipe down. The others might hear you. You must have something for me. Kalatrina must have given you something if you serve the Hall of Truth. If you have nothing please leave. You will blow my cover.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18817})) then -- Sealed Letter
		e.self:Say("This is not good news. I must leave immediately. Here. Take this to Kala.. I mean my father. I found it on the floor of Sir Lucan D'Lere's quarters. Thanks again, messenger. I got this just in time.");
		e.other:Faction(e.self,311,1,0); -- Steel Warriors
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Corrupt Guards of Qeynos
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,18818); -- A Tattered Flier
		eq.unique_spawn(9143,87,0,-154,-55,-10,128); -- spawns Krazen Loosh
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("'Oh no!! It is too late!! Run!!");
	eq.signal(9143,1,30000); -- NPC: Krazen_Loosh
end

-- END of FILE Zone:freportw Guard_Alayle

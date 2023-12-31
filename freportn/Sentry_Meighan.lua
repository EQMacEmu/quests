function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please speak no further.  I am nothing more than a defender of this temple.  The words of Marr lie with the masters and clerics of this temple.  They await you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12131})) then
		e.self:Say("Very good. Nothing more than a sip and I feel much more alert. The next sentry awaits you.");
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,12132,100); -- Item: Part of Potion of Marr
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

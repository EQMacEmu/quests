function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. " - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to Idia.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18161})) then
		e.self:Say("Incoming mail - very good!  Please take this gold for your troubles.");
		e.other:Faction(e.self,284,5); -- league of antonican bards
		e.other:Faction(e.self,281,1); -- knights of truth
		e.other:Faction(e.self,262,1); -- guards of qeynos
		e.other:Faction(e.self,304,-1); -- ring of scale
		e.other:Faction(e.self,285,-1); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,math.random(3,9),0,0,1550);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18160}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18162}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18163})) then
		e.self:Say("Incoming mail - very good!  Please take this gold for your troubles.");
 		e.other:Faction(e.self,284,5); -- league of antonican bards
		e.other:Faction(e.self,281,1); -- knights of truth
		e.other:Faction(e.self,262,1); -- guards of qeynos
		e.other:Faction(e.self,304,-1); -- ring of scale
		e.other:Faction(e.self,285,-1); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,math.random(3,9),0,0,1550);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark

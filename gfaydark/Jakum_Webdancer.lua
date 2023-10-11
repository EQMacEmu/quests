function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. " - If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to Idia.");
	end
end

function Reward(e, gold, experience)
	e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask Idia.");
	e.other:Faction(e.self,284,5); -- league of antonican bards
	e.other:Faction(e.self,281,1); -- knights of truth
	e.other:Faction(e.self,262,1); -- guards of qeynos
	e.other:Faction(e.self,304,-1); -- ring of scale
	e.other:Faction(e.self,285,-1); -- mayong mistmoore
	e.other:QuestReward(e.self,0,0,gold,0,0,experience);
end

function event_trade(e)
	local item_lib = require("items");

	-- gold and exp rewards confirmed by Torven
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18161})) then	-- Felwithe letter
		Reward(e, 3, 750);
		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18160})) then  -- Butcherblock letter
		Reward(e, 6, 750);
		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18162})) then  -- Kaladim letter
		Reward(e, 6, 750);
		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18163})) then  -- Ak'Anon letter
		Reward(e, 9, 1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail. %s - If you are interested in helping the League of Antonican Bards by delivering some mail you should talk to Ton Twostring.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18158}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18155}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18157}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18159}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18166})) then
		e.self:Say("Mail from the front - thank you very much! Please take this gold for your troubles. If you are interested in more work, just ask Ton Twostring.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,284,5,0); -- league of antonican bards
		e.other:Faction(e.self,281,1,0); -- knights of truth
		e.other:Faction(e.self,262,1,0); -- guards of qeynos
		e.other:Faction(e.self,304,-1,0); -- ring of scale
		e.other:Faction(e.self,285,-1,0); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,12,0,0,2000); -- confirmed Live rewards (exp and coin)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

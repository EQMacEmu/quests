function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail!! If you be a new reserve member then show me your Militia Armory Token. If you are not yet initiated then I suggest you head to the Toll Gate in the Commonlands and speak with Guard Valon.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12273})) then
		e.self:Say("Welcome to the Freeport Militia. As a reserve member we require you to wear this tunic and fight when, who and wherever Sir Lucan commands, no questions asked!! There is no turning back!! Remember to keep clear of North Freeport. You have made a wise decision. Hail Sir Lucan!!");
		e.other:Faction(e.self,330,15); -- freeport militia
		e.other:Faction(e.self,336,2); -- coalition of tradefolk underground
		e.other:Faction(e.self,281,-1); -- knights of truth
		e.other:Faction(e.self,362,-1,0); -- priests of marr
		e.other:QuestReward(e.self,0,0,0,0,3097,10000); -- Item: Reserve Militia Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

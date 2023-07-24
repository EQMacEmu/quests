function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("motions you to be silent.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29683}, 0)) then -- Scout Tools
		e.self:Say("Great! I was wondering when they would send someone out to give me these.  In the haste and excitement of this new assignment I forgot them.  This scout business is great I must say.  It sure beats sitting in Southern Ro studying  ruins.  I've been following a patrol of Storm Giants for days.  They have been wandering up and down the coast as if they were looking for something.");
		e.other:Faction(e.self,430,8); -- Faction: Claws of Veeshan
		e.other:Faction(e.self,436,2); -- Faction: Yelinak
		e.other:Faction(e.self,448,-4); -- Faction: Kromzek
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
		eq.unique_spawn(120115,0,0,-3501,-4868,-108); -- a Kromzek Captain
		eq.spawn2(120121,0,0,-3507,-4897,-106,0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3496,-4874,-109,0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3474,-4863,-114,0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3463,-4852,-117,0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3452,-4841,-119,0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3441,-4830,-122,0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3430,-4819,-124,0); -- Kromzek Warrior
		eq.unique_spawn(120001,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

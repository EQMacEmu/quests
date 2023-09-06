function event_death_complete(e)
	local rand = math.random(2);
	if(rand == 1) then
		eq.spawn2(55392,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	if(rand == 2) then
		eq.spawn2(55392,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(55392,0,0,e.self:GetX()+1,e.self:GetY()+1,e.self:GetZ(),e.self:GetHeading());
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 13844})) then
		e.self:Say("Tick.. Pop.. Access granted.");
		-- verified live faction
		e.other:Faction(e.self,333,1,0); -- Faction: King Ak'Anon
		e.other:Faction(e.self,245,1,0); -- Faction: Eldritch Collective
		e.other:Faction(e.self,255,1,0); -- Faction: Gem Choppers
		e.other:Faction(e.self,238,-1,0); -- Faction: Dark Reflection
		e.other:Faction(e.self,287,-1,0); -- Faction: Meldrath
		e.other:QuestReward(e.self,0,0,0,0,13211,10);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

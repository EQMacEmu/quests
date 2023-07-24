-- Ghost_Of_Ridossan
-- Stonebrunt

function event_spawn(e)
	eq.set_timer("depop",300000);
	e.self:Say("Thank you, " .. e.other:GetCleanName() .. ". I am not long for this world. Before I leave, I would like to reward the one who helped me have my revenge. Please, hand me the token of my God, of Cazic-Thule, and I shall pass you the spear I once used. You've earned it.");
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2297}, 0)) then -- Idol of Fear
		e.self:Emote("takes the idol into his spectral hand and shoves the lance into your arms. After letting go of the lance, the ghost immediately begins to fade away. Before it is gone completely, it looks into your eyes and says, 'Suffer.'");
		e.other:Faction(e.self,265,10); -- Faction: Heretics
		e.other:Faction(e.self,231,-10); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-10); -- Faction: Crimson Hands
		e.other:Faction(e.self,242,-10); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254,-10); -- Faction: Gate Callers
		e.other:QuestReward(e.self,0,0,0,0,2099); -- Soulfiend Lance
		eq.stop_timer("depop");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Whaaat foool does seek counsel with this spirit?");
	elseif(e.message:findi("counsel")) then
		e.self:Say("Yes, counsel. It means to meet and converse, fool. Waste my time with definitions of words any dullard would know and taste my anger.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 7114})) then --Soul Trap (combined version)
		e.self:Say("Ahhh. Sweet release. Wait... What is this? No! Do not bind me to this filthy bit of leather! Release! Curse you and curse Azrax to damnation!");
		e.other:Faction(e.self,265,75); -- Faction: Heretics
		e.other:Faction(e.self,242,-15); -- Faction: Deepwater Knights	
		e.other:Faction(e.self,254,-15); -- Faction: Gate Callers			
		e.other:Faction(e.self,231,-15); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-15); -- Faction: Crimson Hands	
		e.other:QuestReward(e.self,0,0,0,0,7105,5000); --Mantle of Souls
		eq.depop_with_timer();		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


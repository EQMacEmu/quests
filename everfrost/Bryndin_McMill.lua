function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("H-ha.. H-hai.. Hail!! It is v-v-very.. C-cold out here. You sh-sh-should light a c-c-campfire.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13242})) then -- requires amiably, Three Quarters of Elixir
		e.self:Say("Ahhh!! I feel warm all over. Thanks. You should go give Arnis McLish a drink of this elixir. Last time I saw him he was headed toward Blackburrow.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,5,0); -- Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Shaman of Justice
		e.other:Faction(e.self,328,1,0); -- Merchants of Halas
		e.other:Faction(e.self,311,1,0); -- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,13243,150); -- One Half Full Bottle of Elixir
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:everfrost  ID:30065, 30115 -- Bryndin_McMill

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("'Brrrrrr! Grr... Grreetings. It is freezing out here!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13241})) then -- requires amiably, Full Bottle of Elixir
		e.self:Say("Mmmm.. I feel much warmer. Thank you. You should now find Bryndin McMill. He could use a swig also. I saw him hanging around two other guards.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,5,0); -- Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Shaman of Justice
		e.other:Faction(e.self,328,1,0); -- Merchants of Halas		
		e.other:Faction(e.self,311,1,0); -- Steel Warriors		
		e.other:QuestReward(e.self,0,0,0,0,13242,150); -- 3/4 Full Bottle of Elixir
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:everfrost  ID:30072 -- Talin_O`Donal

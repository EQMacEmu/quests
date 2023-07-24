function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("My word!! I cannot believe how cold it is out here. I must keep running around just to keep warm.");
	elseif(e.message:findi("megan")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I heard she got lost on the plains. You should go ask her dog, Snowflake, where she is. I hear she is somewhere around the pass to Halas.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		else
			e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13243})) then -- requires amiably, One Half Bottle of Elixir
		e.self:Say("Mmmm.. Thank you stranger. I feel a lot warmer now. You should now go and find [Megan] O'Reilly.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,5,0); -- Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Shaman of Justice
		e.other:Faction(e.self,328,1,0); -- Merchants of Halas
		e.other:Faction(e.self,311,1,0); -- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,13244,150); -- One Quarter of Elixir
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_spawn(e)
	e.self:SetRunning(true);
end

-- END of FILE Zone:everfrost  ID:30049 -- Arnis_McLish

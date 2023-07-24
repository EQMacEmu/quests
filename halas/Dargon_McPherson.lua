function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail, mighty " .. e.other:GetCleanName() .. "! I assume ye must be a [warrior o' the Wolves]. Why else would ye approach a trainer such as meself, then?");
	elseif(e.message:findi("warrior o' the Wolves")) then
		if(e.other:GetFaction(e.self) < 5) then -- requires amiably
			e.self:Say("Aye, 'tis as I thought. I'm glad t' see we've warriors such as yerself amongst the Wolves o' the North. Lately, Kylan's been allowing too many scrawny warriors in, methinks. Nor have they fared well in Everfrrost. Many frreeze to death, ye know... Will ye assist me and [deliver an elixir to young warriors] in Everfrost?");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		elseif(e.other:GetFaction(e.self) > 5) then
			e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		end
	elseif(e.message:findi("deliver an elixir to young warriors")) then
		if(e.other:GetFaction(e.self) < 5) then -- requires amiably
			e.self:Say("Ach, 'tis good o' ye! Take this bottle of elixir to Everfrost Peaks. Find Talin O'Donal. He'll take the first sip, and then instruct ye on who else ye need to find. Do that, and I'll give ye a fine reward when ye return the empty elixir bottle. Good luck, then. Don't die.");
			e.other:SummonCursorItem(13241); -- Item: Full Bottle of Elixir
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		elseif(e.other:GetFaction(e.self) > 5) then
			e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13245})) then -- requires amiably, Empty Bottle of Elixir
		e.self:Say("Ye've proven yerself to be a cut above the rest and aided yer fellow warriors, no matter how worthless they were. Ye may take this. It was found in the snow by one of our foraging parties. I hope it can be of use to a warrior like yerself.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,5,0); -- Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Shaman of Justice
		e.other:Faction(e.self,328,1,0); -- Merchants of Halas
		e.other:Faction(e.self,311,1,0); -- Steel Warriors
		e.other:QuestReward(e.self,math.random(5),0,0,0,eq.ChooseRandom(2012,17001,10004,10017,1038,10016,13877,2135,7007,8008,10009,13007,5014,13003,13107),125); -- random low level items
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

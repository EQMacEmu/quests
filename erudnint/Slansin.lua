-- Inert Potion

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome! Please feel free to look around");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13983})) then
		if(e.self:GetClass() == 41) then
			e.self:Say("Thank you. I have been expecting this. We require it for mixing.");
			-- Confirmed Live Factions
			e.other:Faction(e.self,231,-1); -- Faction: Craftkeepers
			e.other:Faction(e.self,266,-1); -- Faction: High Council of Erudin
			e.other:Faction(e.self,265,1); -- Faction: Heretics
			e.other:Faction(e.self,267,-1); -- Faction: High Guard of Erudin
			e.other:QuestReward(e.self,0,math.random(5),0,0,0,300);
			eq.depop();
		elseif(e.self:GetClass() == 14) then
			e.self:Say("Ha!! What a fool!! I have stolen another potion to add to the crate. I shall make a fortune!! The real Slansin is in back. Now it is time for me to leave.");
			e.other:Faction(e.self,336,2); -- +Coalition of Tradefolk Underground
			e.other:Faction(e.self,229,2); -- +Coalition of Tradefolk
			e.other:Faction(e.self,329,1); -- +Carson McCabe
			e.other:Faction(e.self,230,1); -- +Corrupt Qeynos Guards
			e.other:Faction(e.self,330,1); -- +Freeport Militia
			e.other:QuestReward(e.self,0,0,0,0,0,300);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23001 -- Slansin

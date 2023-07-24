function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Welcome to Kejek! I am Mrowro, apprentice Seer under Saemey Wirewhisker.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6980,item2 = 6978})) then -- Kejek Spirit Powder, Fading Soul Orb
		e.self:Say("I require a Fading Soul Orb and Kejek Spirit Dust in order to perform the ritual that will free the imprisoned souls.");
		e.self:Emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
		e.other:Faction(e.self,5011,2); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,0,0,0,0,2577,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Prowler of the Jungle

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("crouches and narrows his eyes, examining " .. e.other:GetCleanName() .. " attentively. 'I am Prowler of the Jungle, stalker of the corrupt, hunter of the impure. I am the guardian spirit of those who tread silently across the lands destroying that which has been tainted.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6981}, 0)) then -- Kejekan Smithy Hammer
		e.self:Say("Freeing long imprisoned spirits is a noble cause. Your hammer has our blessing to free the souls from their crystalline shadow tombs.");
		e.other:Faction(e.self,5011,2); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,0,0,0,0,6979,1000); -- Soulforge Hammer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

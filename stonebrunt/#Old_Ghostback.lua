 -- Old Ghostback
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks down upon the creature standing beneath him and speaks. 'You are brave to approach a titan such as Old Ghostback. I pray that the spirits have granted you honor and respect as well as courage.");
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
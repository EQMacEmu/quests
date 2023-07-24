-- Snowbeast
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("emits a low rumble and slowly nods his head in " .. e.other:GetCleanName() .. "'s direction. 'I applaud your courage little one. You must either be strong of spirit or weak of mind to show such little fear of me. I am the embodiment of primal instincts and bestial rage and protector of the mighty warrior beasts.");
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
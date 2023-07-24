function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Mind yourself in these parts! There are many dangers. Stay away from the water, if you know whats good for you.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Emote("looks very upset at your mention of the order. 'I cannot believe I have been banned from what little enjoyment can be found in Cabilis. Oh, well, I cannot argue with a legion order. Hand me the order so that I may sign it.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18240})) then --Legion Order (0 signed)
		e.self:Emote("grabs the order from your hand and mumbles something unpleasant and vaguely threatening. He then hands the signed order back to you.");
		e.other:QuestReward(e.self,0,0,0,0,18241); --Legion Order (1 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("blinks her eyes, as if emerging from a trance. 'Oh... my greetings, good " .. e.other:GetCleanName() .. ". Please, do forgive my languor, but the ocean is so serene, so entrancing at times in its calm, soothing motions. I do find myself lost within it each time I am allowed to return.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

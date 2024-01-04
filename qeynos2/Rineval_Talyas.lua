function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("scribe")) then
		e.self:Emote("looks at " .. e.other:GetCleanName() .. " strangely. 'Who told you this?'");
	elseif(e.message:findi("told me")) then
		e.self:Say("'I see. If a scribe is what you seek, then bring me the torn books of fire and ice. A donation of 1000 platinum is needed as well. The donation will be offered as a blessing to the gods.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "This is not enough. Leave my sight at once!";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19071,item2 = 19070, platinum = 1000},1,text)) then
		e.self:Say("Take this book quickly and tell no one about this.");
		e.other:QuestReward(e.self,0,0,0,0,18302,25000); -- Item: Book of Scale
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

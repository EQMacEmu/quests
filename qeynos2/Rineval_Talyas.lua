function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("scribe")) then
		e.self:Emote("looks at " .. e.other:GetCleanName() .. " strangely. 'Who told you this?'");
	elseif(e.message:findi("Karn")) then
		e.self:Say("'I see. If a scribe is what you seek, then bring me the torn books of fire and ice. A donation of 1000 platinum is needed as well. The donation will be offered as a blessing to the gods.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19071,item2 = 19070, platinum = 1000})) then
		e.other:QuestReward(e.self,0,0,0,0,18302); -- Item: Book of Scale
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

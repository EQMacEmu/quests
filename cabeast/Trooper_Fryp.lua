function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! Have you been fishing lately? The water is alive with sewer catfish. Unfortunately, there are also the barracudas!");
	elseif(e.message:findi("sign")) then
		e.self:Say("Alas. The masters have learned of my long evenings in the tavern. Ok... Long mornings and afternoons too. Heh heh. Can't fight authority! Hand me the... Wait. I do not have my quill with me. Go and fetch me a writing quill and hand it to me along with the legion order and then I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18241, item2 = 13051})) then --Legion Order (1 signed), Quill
		e.self:Emote("signs the order and hands it back to you. 'Well... At least I now have this fancy writing quill.'");
		e.other:QuestReward(e.self,0,0,0,0,18242); --Legion Order (2 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

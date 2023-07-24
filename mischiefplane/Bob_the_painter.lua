function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ey yo. Ever read the book of mischief? The libraries full of em! Say... if you ever find the missin chapter on wealth, lemme know.  I'll give ya this here pot o' gold I found.");
	elseif(e.message:findi("library")) then
		e.self:Say("I'd love ta check out a book... especially the book of mischief. Every time I get a library card, them freakin monkeys come and take it from me. Say, maybe you can get one from em!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18008}, 0)) then
		e.self:Say("Ay!!! this is poifect! 'ere take this pot o' gold. It's empty at the moment. Go ask my brother Vinny about the pot and mebbe he'll have a clue how ta get it full agin.");
		e.other:QuestReward(e.self,0,0,0,0,17326);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

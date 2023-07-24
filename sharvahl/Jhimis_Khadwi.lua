function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my store! How may I help you?");
	elseif(e.message:findi("stretching dowels")) then
		e.self:Say("Aye, I have a few left, but they are a big seller right now and I don't know when I'm going to get more in stock. Perhaps we can barter for a set. If you can gather two small owlbear claws and show me your apprentice's cloak, I'll guess that I can justify given you a set of dowels. I'll also be able to make some earrings for my girlfriend. I'm sure she'll love that!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5580, item2 = 6181, item3 = 6181})) then
		e.self:Say("'These claws are very nice! Don't you think they will make splendid earrings? Of course you do! Well, she'd better like them after all of the trouble I had to go through to get them. Here are your dowels. If you need more, I'll have a new crate of them tomorrow. Take care and enjoy... Thank you for shopping with Jhimis!");
		e.other:QuestReward(e.self,{items = {5580,6138}}); -- Item: Cloak of the Khati Sha Apprentice
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

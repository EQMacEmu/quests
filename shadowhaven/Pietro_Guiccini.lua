function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! Have you ever seen my portraits? I am an artisan and collector of portraitures. If you are looking for a portrait, have one to sell, or wish to commission a piece of art I will be happy to take a look.");
	elseif(e.message:findi("portrait")) then
		e.self:Say("I recently purchased a splendid antique portrait of a gorgeous lady that you may be interested in. It is a tad bit faded but a hauntingly beautiful and captivating piece none the less. I would be willing to part with it for 1000 gold pieces.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 1000}, 0)) then -- no xp when turning in 1x gold
		e.self:Say("Here you are, you have made a marvelous purchase. I see that you have excellent taste.");
		e.other:QuestReward(e.self,0,0,0,0,10676); -- Faded Portrait of a Lady 
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

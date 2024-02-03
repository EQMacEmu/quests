function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You!  Remove yourself from my presence!  Do you not know to whom you speak?  My husband is a very powerful noble and if you do not do as I say, he will have your head!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14334})) then -- Arantir's Ring 1st version
		e.self:Say("Oh yes? Arantir? What a fool he was! the man gave me everything, but for all his intelligence, he could never understand why I was truly with him. It was for his power; he could do anything. But when he mysteriously lost it, he became just another toy. I never loved him. Return this ring to him. He will understand that I have no desire to see him again.");
		e.other:Faction(e.self,404, 10,0); -- Truespirit
		e.other:QuestReward(e.self,0,0,0,0,14335,100000); -- Arantir's Ring 2nd version
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61006 -- Challice

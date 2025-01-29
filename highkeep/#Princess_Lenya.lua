function event_spawn(e)
	eq.set_timer("visit",150000);
end

function event_timer(e)
	if(e.timer == "visit") then
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. You may rise. I am sure that you are honored to make my acquaintance. I am Princess Lenya Thex. It is not often that I speak with common folk.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13109})) then
		e.self:Say("The Royal Amulet of Thex!! I missed it so. I am sorry I escaped so quickly. I am glad you did not run into the Teir'Dal torturers. They are quite formidable. I shall be continuing on to Qeynos. Here. Take this as proof that you have rescued me. My father should be quite happy with your deed. Such beauty as mine should never be locked up. If you cannot find my father then search for Tolon Nurbyte. He is usually at the Traveler's Inn. Good bye.");
		e.other:Faction(e.self,226,25); -- Faction: Clerics of Tunare
		e.other:Faction(e.self,279,25); -- Faction: King Tearis Thex
		e.other:Faction(e.self,5002,18); -- Faction: Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,18841,50); -- Item: Sealed Letter
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
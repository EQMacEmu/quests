function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A pleasure to meet you. I am Countess Eysa Florawhisper of the Tunarean Court. Are you a friend of the court?");
	elseif(e.message:findi("friend of the court")) then
		e.self:Say("You appear to be a creature that has seen many foreign lands. There are a number of fruits and seeds that I desire in order to plant them and preserve their species here in the wakening land. I will provide a bag for you that will preserve the seeds until they can be returned to me. Will you gather seeds for me?");
	elseif(e.message:findi("gather")) then
		e.self:Say("I seek the following fruits and seeds. A misty acorn, emerald orange, bag of caynar nuts, vineclinger berries, ripened heartfruit, rathe berries, marr cherries, and flarefire seeds.");
		e.other:SummonCursorItem(17864); -- Item: Empty Seed Collection Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29067}, 0)) then
		e.self:Say("Ahh, why thank you, friend! We are greatful. I believe if we work together, those children of Zek can be driven back in time. Otherwise, survival hangs in the balance, for both of us. Take this token back to the sentry as a symbol of our acceptance.");
		e.other:Faction(e.self,449,10); -- tunarean court
		e.other:QuestReward(e.self,0,0,0,0,29623);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 24863}, 0)) then
		e.self:Say("Ohhhh! You're the sweetest, " .. e.other:GetCleanName() .. ". The nymphs of the Tunarean Court recognize you as a friend of our kind and our botanical brethren.");
		e.other:Faction(e.self,449, 20); -- Faction: Tunarean Court
		e.other:QuestReward(e.self,0,0,0,0,24864,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

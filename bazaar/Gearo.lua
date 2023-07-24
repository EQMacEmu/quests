function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there friend. My name is Gearo and as you can see I'm a Gnome, so what can I do for ya?");
	elseif(e.message:findi("take the gem")) then
		e.self:Say("Good " .. e.other:GetCleanName() .. "! Here they are, please take them back to that gargantuan barbarian and let him know I want a raise for all this hard work!");
		e.other:SummonCursorItem(4767); -- Item: Bag of Assorted Gems
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4766},0)) then --Assorted Tailoring Supplies
		e.self:Say("Ah you were sent from Steaon I see. So what's that tall drink of water up too? He must be busy at the store if he has you delivering his supplies for him. Well enough about all that. If he has trusted you to bring his supplies here I suppose I can give you these gems I picked up for him. Will you [take the gems] to him?");
		e.other:Faction(e.self,1508, 25); 	--Traders of the Haven
		e.other:Faction(e.self,1510, 2); 	--House of Fordel
		e.other:Faction(e.self,1511, 2); 	--House of Midst
		e.other:Faction(e.self,1512, 2); 	--House of Stout
		e.other:QuestReward(e.self,0,0,0,0,0,1000);		--This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

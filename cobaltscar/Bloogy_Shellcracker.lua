function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, strange one. I am Bloogy Shellcracker, the preparer of meals for my people. I am not familiar with the culinary tastes of your kind but you are welcome to purchase some of my supplies. I will also barter for ingredients to some of my exotic dishes.");
	elseif(e.message:findi("ingredients") or e.message:findi("dish")) then
		e.self:Say("The rarest treat I can prepare for my people is saucy salted seadragon steak. I wish to barter for some water dragon or sea dragon meat, saltwater seaweed, and fish eggs. The rest of the ingredients are collected locally by our collectors.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22812,item2 = 19113,item3 = 16498,item4 = 16498}, 0) or item_lib.check_turn_in(e.self, e.trade, {item1 = 22813,item2 = 19113,item3 = 16498,item4 = 16498}, 0)) then
		e.self:Say("It has been many moons since my people have feasted on this rarest of meat. Take this totem crafted in the form of our oceanlord Prexus and inscribed with the runes of our people. May the oceans watch over you, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,432,5); -- Faction: Othmir
		e.other:Faction(e.self,431,-1); -- Faction: Ulthork
		e.other:QuestReward(e.self,0,0,0,0,28514,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

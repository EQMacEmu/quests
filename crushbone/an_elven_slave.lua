function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Slavedrivers are just lackeys for the [taskmaster]. He is the real orc in charge.");
	elseif(e.message:findi("taskmaster")) then
		e.self:Say("The taskmaster?? He is that large orc who runs around with that [bronze earring] in his ear.");
	elseif(e.message:findi("bronze earring")) then
		e.self:Say("Yeah, a bronze earring; He wears it like a newly crowned king. If I ever had that earring I know I would stand a chance at escape.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- All Confirmed Live Experience

	if(e.self:GetRace() == 5 and e.self:GetGender() == 0) then -- male high elf slave
		if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
			e.self:Say("Not that!! I need key number 20!!");
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20020})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Faction(e.self,275,2,0); -- Faction: Keepers of the Art
			e.other:Faction(e.self,279,1,0); -- Faction: King Tearis Thex
			e.other:Faction(e.self,246,1,0); -- Faction: Faydarks Champions
			e.other:Faction(e.self,239,-1,0); -- Faction: The Dead
			e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,2),0,0,800);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:QuestReward(e.self,0,0,0,0,18901,5000); -- Item: A Ragged Cloth Note
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 5 and e.self:GetGender() == 1) then -- female high elf slave
		if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
			e.self:Say("Please!! I need a key with a number 21!!");
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20021})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Faction(e.self,275,2,0); -- Faction: Keepers of the Art
			e.other:Faction(e.self,279,1,0); -- Faction: King Tearis Thex
			e.other:Faction(e.self,246,1,0); -- Faction: Faydarks Champions
			e.other:Faction(e.self,239,-1,0); -- Faction: The Dead
			e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,2),0,0,800);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:QuestReward(e.self,0,0,0,0,18902,5000); -- Item: A Torn Drawing
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 4 and e.self:GetGender() == 0) then -- male wood elf slave
		if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
			e.self:Say("Not that!! I need key number 18!!");
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20018})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Faction(e.self,326,2); -- Faction: Emerald Warriors
			e.other:Faction(e.self,270,-1); -- Faction: Indigo Brotherhood
			e.other:Faction(e.self,325,1); -- Faction: Merchants of Felwithe
			e.other:Faction(e.self,276,1); -- Faction: Kelethin Merchants
			e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,2),0,0,800);
			e.other:GiveCash(0,7,3,0);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:QuestReward(e.self,0,0,0,0,18903,5000); -- Item: A Tattered Cloth Note
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 4 and e.self:GetGender() == 1) then -- female wood elf slave
		if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
			e.self:Say("Please!! I need a key with a number 19!!");
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20019})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Faction(e.self,326,2); -- Faction: Emerald Warriors
			e.other:Faction(e.self,270,-1); -- Faction: Indigo Brotherhood
			e.other:Faction(e.self,325,1); -- Faction: Merchants of Felwithe
			e.other:Faction(e.self,276,1); -- Faction: Kelethin Merchants
			e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,2),0,0,800);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:QuestReward(e.self,0,0,0,0,18904,5000); -- Item: A Faded Wedding Cloth
			eq.depop_with_timer();		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

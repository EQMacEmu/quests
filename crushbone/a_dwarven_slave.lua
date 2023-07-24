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
	-- All confirmed live experience

	if(e.self:GetRace() == 8 and e.self:GetGender() == 0) then -- male dwarven slave
		if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
			e.self:Say("No, no!! I do not need this!! Get me key number 16!!");
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20016})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Faction(e.self,227,2); -- Faction:  Clerics of Underfoot
			e.other:Faction(e.self,274,2); -- Faction: Kazon Stormhammer
			e.other:Faction(e.self,293,1); -- Faction: Miners Guild 249
			e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,2),0,0,800);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:QuestReward(e.self,0,0,0,0,18905,5000); -- Item: A Worn Rune
			eq.depop_with_timer();		
		end
	elseif(e.self:GetRace() == 8 and e.self:GetGender() == 1) then -- female dwarven slave
		if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
			e.self:Say("What is this!!? Get me key number 17!!");
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20017})) then
			e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
			e.other:Faction(e.self,312,2); -- Faction: Storm Guard
			e.other:Faction(e.self,274,1); -- Faction: Kazon Stormhammer
			e.other:Faction(e.self,293,1); -- Faction: Miners Guild 249
			e.other:Faction(e.self,290,1); -- Faction: Merchants of Kaladim
			e.other:Faction(e.self,232,-1); -- Faction: Craknek Warriors
			e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,2),0,0,800);
			eq.depop_with_timer();
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10351})) then
			e.self:Say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
			e.other:QuestReward(e.self,0,0,0,0,18906,5000); -- Item: A Small Wood Carving
			eq.depop_with_timer();		
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

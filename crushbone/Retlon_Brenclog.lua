function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh my word!! A rescuer!! Hurry! Get me out of these chains!! Go find the orc who has the keys!");
	elseif(e.message:findi("get.* out")) then
		e.self:Say("I am from Ak'Anon! I must return a [spellbook] to the Eldritch Collective.");
	elseif(e.message:findi("spellbook")) then
		e.self:Say("What?! I am stuck here and you are worried about a spellbook?! Forget that! Just get the keys to my shackles from one of the orcs! HURRY!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {copper = 1})) then
		e.self:Say("No, no!! I do not need this!! Get me key number 15!!");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20015})) then
		e.self:Say("Good work!! I shall be on my way. Farewell my friend!!");
		e.other:Faction(e.self,245,2); -- Faction: Eldritch Collective
		e.other:Faction(e.self,238,-1); -- Faction: Dark Reflection
		e.other:Faction(e.self,239,-1); -- Faction: The Dead
		e.other:Faction(e.self,255,1); -- Faction: Gem Choppers
		e.other:Faction(e.self,333,1); -- Faction: King Ak'Anon
		e.other:QuestReward(e.self,0,math.random(10),math.random(5),0,0,1000);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1717})) then
		e.self:Say("Ah! A letter from my brother! Mmm... no... no I don't have Tergon's spellbook. The orc's prophet took it and then they locked me in chains! Now why don't you go do something useful and get me key number 15!!");
		e.other:Faction(e.self,245,2); -- Faction: Eldritch Collective
		e.other:Faction(e.self,238,-1); -- Faction: Dark Reflection
		e.other:Faction(e.self,239,-1); -- Faction: The Dead
		e.other:Faction(e.self,255,1); -- Faction: Gem Choppers
		e.other:Faction(e.self,333,1); -- Faction: King Ak'Anon
		e.other:QuestReward(e.self,0,0,0,0,0,500);
		eq.depop_with_timer();		
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Retlon Benclog

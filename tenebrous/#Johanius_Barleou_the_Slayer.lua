function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_timer(e)
	eq.depop();
end

function event_say(e)
	if(e.other:GetFaction(e.self) < 6 and e.message:findi("vampyre slayer")) then
		e.self:Emote("hands " .. e.other:GetCleanName() .. " his bloodied stake and rifles through his backpack. 'Here, hand me back my stake and you can have this brand new one that has been enchanted by the Praecantors of the Magus Conlegium.'");
		e.other:SummonCursorItem(2690); -- Blood Crusted Stake
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2690}, 0)) then
		e.self:Say("On behalf of the citizens of Katta Castellum I extend our gratitude for your assistance in our war with the Coterie of the Eternal Night!");
		e.other:QuestReward(e.self,0,0,0,0,2689,5000); -- Johanius Stake of Slaying
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

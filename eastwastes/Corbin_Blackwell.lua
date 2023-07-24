function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hurry! There's not much time. Give me the key and show me proof that you are a friend sent to rescue me...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1046,item2 = 30162}, 0)) then
		e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
		e.other:QuestReward(e.self,0,0,0,0,30162);
		eq.unique_spawn(116034,17,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116035)) then
			eq.depop(116035);
			eq.unique_spawn(116036,0,0,-3188,-574,158,62); -- NPC: Dobbin_Crossaxe
		end
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

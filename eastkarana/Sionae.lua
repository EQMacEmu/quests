function event_spawn(e)
	eq.set_timer("despawn",3600000);
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20450})) then
		e.self:Say("I see that the time has come. Take the amulet and give it to the third of our kin, Nuien. I will meet you at the gathering.");
		e.other:QuestReward(e.self,0,0,0,0,20451);
		eq.unique_spawn(15167,0,0,300,-3657,3,183); -- spawn nuien
		eq.move_to(-1595,-3670,-18,0,true);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("shivers as her power flows into the air above the gathering.");
		e.self:CastSpell(790,e.self:GetID()); -- Spell: Call of the Storm
	end
end

function event_spawn(e)
	eq.set_timer("attack",1000);
	eq.set_timer("depop",120000);
end

function event_timer(e)
	if(e.timer == "attack") then
		eq.attack_npc_type(110057);
		eq.stop_timer("attack");
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end
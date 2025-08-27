-- Epic NPC -- Keeper_of_Souls

function event_spawn(e)
	eq.set_timer("summit",2880000);
end

function event_timer(e)
	if(e.timer == "summit") then
		eq.stop_timer("summit");
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		eq.stop_timer("summit");
	else
		eq.set_timer("summit",2880000);
	end
end

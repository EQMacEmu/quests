function event_spawn(e)
	eq.set_timer("playdead",1000);
end

function event_combat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",50000);
		e.self:SetAppearance(3);
	end
end

function event_timer(e)
	if(e.timer == "playdead") then
		e.self:SetAppearance(3);
		eq.stop_timer("playdead");
		eq.set_timer("depop",50000);
	elseif(e.timer == "depop") then
		e.self:Say("Uhhhh... I've been poisoned. Carry on the work men. Don't let me die in vain.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116100)) then
			eq.get_entity_list():GetMobByNpcTypeID(116100):Say("Heh, I never liked him anyway...");
		end		
		eq.depop();
	end
end

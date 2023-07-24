function event_spawn(e)
	eq.set_timer("depop", 100000);
	eq.set_timer("move", 1);
end

function event_timer(e)

	if ( e.timer == "move" and not e.self:IsEngaged() ) then
		eq.set_timer("move", 6000);
		
		local boss = eq.get_entity_list():GetMobByNpcTypeID(207003); -- The_Acolyte_of_Affliction
		if ( not boss or not boss.valid ) then
			eq.depop();
		end
		e.self:MoveTo(boss:GetX(), boss:GetY(), boss:GetZ() - 5.5, -1, true);

	elseif ( e.timer == "depop" ) then
		eq.depop();
	end

end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end
local loc;

function event_signal(e)
	if ( e.signal == 1 ) then
		loc = 1;
		eq.set_timer("move", 10000);
		e.self:CastSpell(3011, e.self:GetID()); -- Sorrow Song
		eq.set_timer("song", 5000);
	
	elseif ( e.signal == 2 ) then
		eq.stop_timer("move");
		e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
		e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off
		e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		e.self:SetBodyType(21, false);	-- Animal
		
		local boss = eq.get_entity_list():GetMobByNpcTypeID(207001); -- Saryrn
		if ( boss and boss.valid ) then
			e.self:MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), -1, true);
		end
	
	elseif ( e.signal == 3 ) then
		eq.stop_timer("move");
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro on
		e.self:SetSpecialAbility(25, 1); -- Immune to Aggro on
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players on
		e.self:SetBodyType(11, false);	-- NoTarget
		e.self:WipeHateList();
		e.self:MoveTo(1, -1, 580, 128, true);
	end
end

function event_timer(e)

	if ( e.timer == "move" ) then
		
		if ( loc == 1 ) then
			eq.set_timer("move", 20000);
			e.self:MoveTo(-62, -134, 580, 0, true);
			loc = 2;
		elseif ( loc == 2 ) then
			eq.set_timer("move", 20000);
			e.self:MoveTo(64, -167, 580, 0, true);
			loc = 3;
		else
			eq.set_timer("move", 25000);
			e.self:MoveTo(1, -1, 580, 128, true);
			loc = 1;
		end
		
	elseif ( e.timer == "song" ) then
		eq.stop_timer(e.timer);
		e.self:CastSpell(3011, e.self:GetID()); -- Sorrow Song
	end
end

function event_waypoint_arrive(e)
	if ( not e.self:IsEngaged() ) then
		e.self:CastSpell(3011, e.self:GetID()); -- Sorrow Song
		eq.set_timer("song", 5000);
	end
end

function event_combat(e)
	if ( not e.joined ) then
		e.self:MoveTo(1, -1, 580, 128, true);
	end
end

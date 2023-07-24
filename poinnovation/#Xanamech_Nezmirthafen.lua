function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:SetAppearance(0);
		eq.set_timer("wake", 3500);
	end
end

function event_spawn(e)
	eq.set_timer("lie", 300);
	eq.set_timer("depop", 1800000);
end

function event_timer(e)

	eq.stop_timer(e.timer);
	
	if ( e.timer == "depop" ) then
		eq.depop();
		
	elseif ( e.timer == "lie" ) then
		e.self:SetAppearance(1);
		
	elseif ( e.timer == "wake" ) then
		e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
		e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off
		e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
		e.self:SetBodyType(5, false); -- Construct
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_death_complete(e)
	eq.signal(206033, e.killer:GetID()); -- Nitram_Anizok
end

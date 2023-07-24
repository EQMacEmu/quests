function event_spawn(e)
	eq.set_timer("depop", 600000);
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
	
	-- anti-cheat: these should not be able to get to higher floors
	if ( e.self:GetZ() > 1800 and e.self:Charmed() ) then
		e.self:BuffFadeByEffect(22);
		e.self:ModifyNPCStat("mr", "200");
	end
end

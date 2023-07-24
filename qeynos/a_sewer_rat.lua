function event_spawn(e)
	e.self:SetRunning(true);
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("squeaks as it wanders.");
		end
	end	
end

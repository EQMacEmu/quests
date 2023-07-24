function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("clicks as a plate slides to the side revealing a hose that extends and sucks up an item from the ground");
		end
	end	
end
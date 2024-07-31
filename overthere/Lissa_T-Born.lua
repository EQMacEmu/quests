function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("picks up an item from the ground and says, 'This place is enough of a wreck without people throwing things on the ground adding to the clutter!");
		end
	end	
end
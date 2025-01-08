function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Only a fool drops such booty upon the ground. 'Tis the now the property of the Pirates of Gunthak!");
		end
	end	
end
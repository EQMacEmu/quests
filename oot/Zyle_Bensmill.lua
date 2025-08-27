
function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Only a fool drops such booty upon the ground. 'This now be the property of the Pirates of Gunthak!");
		end
	end	
end



function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Say("Join the Pirates of Gunthak, wench, or die!!");
		eq.signal(69022,1); -- NPC: Euboea_Delewyn
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Foolish maiden!");
		eq.attack_npc_type(69022); --Euboea_Delewyn
	end
end
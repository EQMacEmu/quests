local count = 0;

function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Look what I've found! What a great find! It used to be yours, but now it is mine!");
		end
	end	
end

function event_waypoint_arrive(e)
	count = count + 1;
	if ( count > 10 and math.random(100) == 1 ) then
		count = 0;
		e.self:Emote("shouts, 'Nillipuss, Nillipuss is my name.  Stealing jumjum is my game.  Think you can catch me?  Let's see if you can!  I'll always run faster than you ever ran.'");
		eq.signal(19052, 1); -- Reebo_Leafsway
	end
end

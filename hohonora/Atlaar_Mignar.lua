local n;

function event_signal(e)
	if ( e.signal == 1 ) then
		eq.stop_timer("animate");
		e.self:Say("Yes sir! Sergeant Bryson, sir!");
		e.self:MoveTo(-1337, 190, 7.5, 65, true);
		
	elseif ( e.signal == 2 ) then
		e.self:Say("Yes sir! Sergeant Bryson, sir!");
		eq.set_timer("move", 5000);
		
	elseif ( e.signal == 3 ) then
		e.self:Say("Sir! Yes, sir!");
		
	elseif ( e.signal == 5 ) then
		e.self:Say("Let us spar!");
		eq.set_timer("animate", 1);
	end
end

function event_timer(e)
	
	if ( e.timer == "animate" ) then
		eq.set_timer(e.timer, 120000);
		eq.set_timer("doanim", 3800);
		n = 0;
	
	elseif ( e.timer == "doanim" ) then
		n = n + 1;
		
		local anim = 1;
		if ( n == 2 ) then
			anim = 3;
		elseif ( n == 3 ) then
			anim = 11;
		elseif ( n == 4 ) then
			anim = 7;
			eq.stop_timer(e.timer);
		end
		e.self:DoAnim(anim);
	
	elseif ( e.timer == "move" ) then
		eq.stop_timer(e.timer);
		e.self:MoveTo(-1349, 148, 7.5, 9, true);
	end
end

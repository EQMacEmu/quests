function event_spawn(e)
  e.self:SetRunning(true);
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Time to push our weight around. Ahhh. There is nothing better than being a Qeynos Guard.");
		eq.start(18)
	elseif(e.signal == 2) then
		e.self:Say("Ha! You do that and see what happens. No one will miss another untalented, voiceless bard!");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Hello again, Ms. Storyswapper! Did I ever tell you about the new song tax that was attached to last week's bard tax? You'd best pay up or I will be forced to lock you up in the dungeon.");
		eq.signal(12100,1); -- NPC: Misty_Storyswapper
	elseif(e.wp == 2) then
		eq.stop();
		eq.move_to(-2026,-2926,44,223,true);
	end
end

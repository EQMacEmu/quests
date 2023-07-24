function event_spawn(e)
	eq.set_timer("Tovax",10000);
end

function event_timer(e)
	if(e.timer == "Tovax") then
		e.self:Say("Huh?  What the...  oh, no...  S'ragg!  PLEASE!  NO!  Bertoxxulous save me!");
		eq.signal(45091,1); -- NPC: Sragg Bloodheart	
		eq.stop_timer("Tovax");
	end
end
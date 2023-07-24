function event_spawn(e)
	eq.set_timer("checking",1600000);
end

function event_timer(e)
	if(e.timer == "checking" and not e.self:IsEngaged())then
		e.self:Say("Checking Master.");
		eq.set_timer("sorry",8000);		
	elseif(e.timer == "sorry")then
		e.self:Say("Sorry, Master, I only have one part. I have the circular monoplanar fastener, but not the reciprocal perpetual linear motivating sprocket. I will be able to acquire it within a few hours.");
		eq.stop_timer(e.timer);
		eq.set_timer("wish",3000);
	elseif(e.timer == "wish")then
		e.self:Say("As you wish Master.");
		eq.stop_timer(e.timer);
	end
end

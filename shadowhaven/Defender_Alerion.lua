function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Glad to know you, " .. e.other:GetCleanName() .. ".  Please do your best to watch your step around this pool.  It has been nice to see so many new faces around the city, but many has been the time that I have had to dive in after someone and, to be honest, I am not the greatest swimmer in all the world- now with all of the extra traffic, I get a bit nervous.");
	end
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("combatsay",300000);
	else
		eq.stop_timer("combatsay");
	end
end

function event_timer(e)
	e.self:Say("A fool you are indeed to test your fighting skills to mine!  You shall now die by my blade!");
end

function event_death_complete(e)
	eq.stop_timer("combatsay");
end

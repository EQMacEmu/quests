function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, I am Olaof, I am an aspiring musician, you know. For now I am just a Defender, one of the many. It was nice to meet you and I hope you enjoy your stay.");
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

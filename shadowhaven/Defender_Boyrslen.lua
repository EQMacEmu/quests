function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler. It's nice to have you with us in the Haven. Our city is a place of freedom and prosperity. Please respect all that we have accomplished when visiting and you will always be welcome.");
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

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. You're looking to make a deposit are you?  Well then those guys over there are who you want to see. Bankers aren't usually as armed as I am, unless of course your payment is extremely late.");
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

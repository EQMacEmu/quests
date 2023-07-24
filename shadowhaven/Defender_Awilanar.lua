function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, I am Awilanar, one of the finest front line archers ever to sling an arrow.  Shadowhaven may rest easy on my watch- given a fair shot, I could hit a rabbit at night in deep fog, let there be no doubt.");
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

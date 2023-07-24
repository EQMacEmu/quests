function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met, " .. e.other:GetCleanName() .. ". It is a pleasure to have you in Shadowhaven.  Should you venture up these stairs, you will find yourself in the Fordel Quarter. Good luck to you, traveler.");
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

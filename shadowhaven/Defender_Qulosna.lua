function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Fine day in the Haven, is it not " .. e.other:GetCleanName() .. "? I think this might be a nice time for a break at the tavern, if I don't say so myself.");
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

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you " .. e.other:GetCleanName() .. ", I hope you are having a splendid time in the Shadowhaven. If you are in search of that special magical item that you just cant seem to find in any of our stores make sure you visit the Bazaar. Take care.");
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

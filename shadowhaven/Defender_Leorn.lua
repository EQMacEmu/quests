function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Fordel Quarter " .. e.other:GetCleanName() .. ", If you are heading in further please watch your step. Some drunk came through and dropped a bottle right on the steps.  We have someone already on the way to clean it up just wanted to make sure nobody stepped on it.");
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

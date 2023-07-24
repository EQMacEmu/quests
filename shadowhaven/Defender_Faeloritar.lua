function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Knights Table " .. e.other:GetCleanName() .. ", I am Faeloritar and I watch the bar here. There have been some pretty rowdy brawls here in the past, so we always have a guard near by in case things get out of hand. It's not often that a fight breaks out here, but it sure is fun when one does.");
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

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ".  These stairs will take you to the training ground for new Shadowhaven Defenders recruits. Please be careful when in the training area, we wouldn't want to have any unfortunate accidents.");
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

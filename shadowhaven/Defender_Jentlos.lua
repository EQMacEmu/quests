function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi dere " .. e.other:GetCleanName() .. ", it sure is a big city we got here, so if ya get lost at any time make sure you ask somebuddy where to get where yer tryin to go!");
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

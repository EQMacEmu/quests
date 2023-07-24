function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you, " .. e.other:GetCleanName() .. ". I welcome you to the finest and most prosperous city in all of Luclin. Please enjoy your stay with us in the Shadowhaven.");
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

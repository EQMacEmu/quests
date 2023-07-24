function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there " .. e.other:GetCleanName() .. ", if you are leaving the Haven to go trade in the Bazaar, I hope you have a wonderful and prosperous day! Make sure you come back and visit soon.");
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

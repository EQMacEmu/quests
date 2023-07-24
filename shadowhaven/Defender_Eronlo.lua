function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo dere, " .. e.other:GetCleanName() .. ".  Da Shadowhaven can be a confusin place at times, but it can be quite easy to git around once ya know what quarter you are in. The city consists of four of these quarters being da Commons quarter which is here, along with the House of Stout, House of Fordel and House of Midst.");
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

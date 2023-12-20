function event_say(e)
	
	if ( e.message:findi("hail") ) then
		e.self:Say("What do you want? I have no reason to waste my time with the likes of you!");
	elseif(e.message:findi("where")) then
		e.self:Say("There have been reports of murders within Highpass, murders in which the victims were drained of every iota of blood. I was sent here by my [guild master] to investigate.");
	elseif(e.message:findi("guild master")) then
		if(e.other:GetFaction(e.self) <= 4) then -- requires amiably faction
			e.self:Say("I was sent here by Noxhil V'Sek of the Dead. We are the necromancers and shadowknights of Neriak.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		end	
	end
end

function event_spawn(e)
	eq.set_timer("timecheck", 60000);
end

function event_timer(e)
	if ( e.timer == "timecheck" and not e.self:IsEngaged() ) then
	
		local zoneTime = eq.get_zone_time()["zone_hour"];

		if ( zoneTime > 18 or zoneTime < 8 ) then
			eq.depop_with_timer();
		end
	end
end

function event_death_complete(e)
	eq.update_spawn_timer(336269, 1200000);
end

function event_say(e)
	
	if ( e.message:findi("hail") ) then
		e.self:Say("Greetings, "..e.other:GetName().."! How lucky you are to encounter the greatness of the legendary Sir Edwin Motte, slayer of cyclopes, battler of beasts, crusher of creatures, masher of monsters, eradicator of evil and champion of the third annual dart championship of Freeport.");
	end
end

function event_spawn(e)
	eq.set_timer("timecheck", 60000);
end

function event_timer(e)
	if ( e.timer == "timecheck" and not e.self:IsEngaged() ) then
	
		local zoneTime = eq.get_zone_time()["zone_hour"];

		if ( zoneTime < 19 and zoneTime > 6 ) then
			eq.depop_with_timer();
		end
	end
end

function event_death_complete(e)
	eq.update_spawn_timer(336269, 1200000);
end

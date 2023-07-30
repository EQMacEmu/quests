function event_combat(e)
	if ( e.joined ) then
		eq.zone_emote(0, "Evynd Firestorm says 'I will see that my flames consume you.'");
		eq.set_timer("portals", 120000);
	else
		eq.stop_timer("portals");
	end
end

function event_death_complete(e)
	eq.spawn2(209156, 0, 0, -1123, -1732, 1269, 64); -- #Askr_the_Lost
end

function event_timer(e)
	if ( e.timer == "portals" ) then
		eq.zone_emote(0, "Evynd waves his hands in the air, calling the power of the firestorm through the blazing portals.");
		eq.signal(209122, 1); -- A_firestorm_portal 
	end
end

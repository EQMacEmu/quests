function event_spawn(e)
	eq.set_timer("depop", 11700000);
end

function event_timer(e)
	eq.depop();
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_death_complete(e)
	eq.zone_emote(0, "Dead silence reigns throughout the crypt as the heroes stand victorious over the High Priests lifeless body. Moments later a soft almost inaudible voice echoes through your mind whispering, 'Free us. Free us you must.' Then a wretched creatures appears out of nowhere shaking and muttering gibberish.");	

	eq.unique_spawn(200267, 0, 0, 309, 330, -72.122, 128); -- Tarkil_Adan
	eq.signal(200267, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

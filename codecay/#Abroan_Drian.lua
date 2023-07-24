local s1, s2, s3;

function event_signal(e)
	if ( e.signal == 1 ) then -- from #Fran_Prisoal
		s1 = true;
	end
	if ( e.signal == 3 ) then -- from #Breddan_Rutyl
		s3 = true;
	end
end

function event_death_complete(e)
	if ( s1 and s3 ) then
		eq.depop_with_timer(200007); -- #_Carprin_Deatharn
		eq.zone_emote(0, "A scream of rage engulfs the crypt as the last vestiges of the shield of dark force surrounding Carprin Deatharn fades away.");
		eq.unique_spawn(200232, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ() + 3, e.self:GetHeading() ); -- #Carprin_Deatharn
	else
		eq.signal(200229, 2); -- to #Breddan_Rutyl
		eq.signal(200230, 2); -- to #Fran_Prisoal
	end
end

function event_spawn(e)
	s1, s2, s3 = false, false, false;
	eq.set_timer("depop", 800000);
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

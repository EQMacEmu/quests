function event_spawn(e)
	eq.set_timer("depop", 12300000);
	e.self:SetGuardSpot(384, -112, -53.9, 197);
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
		eq.set_timer("drophate", 1000);
	else
		eq.resume_timer("depop");
		eq.stop_timer("drophate");
	end
end

function event_death_complete(e)
	eq.zone_emote(0, "Dark laughter sounds from deeper within the chapel as a menacing voice is heard saying, 'Come great corrupter of entropy and decay. Stop these foolish mortals from violating our masters chapel.");
	eq.unique_spawn(200225, 0, 0, 405, 135, -54, 128); -- #Avhi_Escron
end

function event_timer(e)

	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.01666 ) then -- averages to once per minute
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
		
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

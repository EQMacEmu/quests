function event_spawn(e)
	eq.set_timer("roar",1000);
end

function event_timer(e)
	if(e.timer == "roar") then
		eq.stop_timer("roar");
		eq.set_timer("depop",1800000);
		eq.zone_emote(0,"A giant reptile roars, as it sinks below the surface of the pond. It appears that is senses your approach.");
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_death_complete(e)
	eq.unique_spawn(83056,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

function event_spawn(e)
	--eq.set_timer("move", 6000); -- Maareq is permarooted in AK's time, so don't need this
	eq.set_timer("check", 1000);
end

function event_timer(e)
	
	local boss = eq.get_entity_list():GetMobByNpcTypeID(207004); -- Maareq_the_Prophet
	if ( not boss or not boss.valid ) then
		eq.depop();
	end
	
	if ( e.timer == "check" ) then
		if ( e.self:CalculateDistance(boss:GetX(), boss:GetY(), boss:GetZ()) < 10 ) then
			eq.signal(207004, 1); -- Maareq_the_Prophet
			e.self:Emote("adheres to Maareq's flesh and is quickly absorbed!");
			eq.depop();
		end
		
	elseif ( e.timer == "move" ) then
		e.self:MoveTo(boss:GetX(), boss:GetY(), boss:GetZ(), -1, true);
	end
end
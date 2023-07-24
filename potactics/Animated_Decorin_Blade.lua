local TAGRIN_TYPE = 214054;

function event_spawn(e)
	eq.set_timer("depop", 120000);
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
		
		local mob = eq.get_entity_list():GetMobByNpcTypeID(TAGRIN_TYPE);
		if ( mob and mob.valid and mob:IsEngaged() ) then
			local t = mob:GetHateRandomClient();
			if ( t and t.valid ) then
				e.self:AddToHateList(t);
			end
		end
	end
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("tick", 6000);
	else
		eq.stop_timer("tick");
	end
end

function event_timer(e)
	if ( e.timer == "tick" ) then
		local npc = eq.get_entity_list():GetNPCByNPCTypeID(209061); -- Kuanbyr_Hailstorm
		if ( npc and npc.valid and e.self:GetTarget() and e.self:GetTarget().valid ) then
			npc:AddToHateList(e.self:GetTarget(), 1);
		end
	end
end

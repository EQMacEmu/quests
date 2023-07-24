function event_timer(e)

	if ( e.timer == "teleport" ) then
	
		eq.set_timer("teleport", math.random(2, 30) * 1000);
		local target = e.self:GetTarget();
		
		if ( target and target.valid ) then
			e.self:SetHate(target, 1);
			if ( target:IsClient() ) then
				target:CastToClient():MovePC(206, -231, -241, 2, 192*2);
			end
		end
		
	elseif ( e.timer == "boundscheck" ) then
		if ( e.self:GetX() > 400 or e.self:GetX() < 100 ) then
			e.self:Emote("rattles violently and disappears!");
			e.self:GMMove(e.self:CastToNPC():GetSpawnPointX(), e.self:CastToNPC():GetSpawnPointY(), e.self:CastToNPC():GetSpawnPointZ(), e.self:CastToNPC():GetSpawnPointH());
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
			e.self:WipeHateList();
			e.self:Heal();
		end
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("teleport", math.random(2, 30) * 1000);
		eq.set_timer("boundscheck", 3000);
	else
		eq.stop_timer("teleport");
		eq.stop_timer("boundscheck");
	end
end

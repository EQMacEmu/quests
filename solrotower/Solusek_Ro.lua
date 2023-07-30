function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("anti_cheat", 30000);
	else
		eq.stop_timer("anti_cheat");
	end
end

function event_timer(e)

	if ( e.timer == "anti_cheat" ) then

		if ( e.self:GetZ() < 240 and e.self:GetHPRatio() < 50 ) then
		
			local npcList = eq.get_entity_list():GetNPCList();
			for npc in npcList.entries do
			
				if ( npc.valid and npc:GetNPCTypeID() == 212041 and not npc:IsEngaged() ) then -- Guardian_of_Fire
					npc:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
				end
			end
			e.self:HealDamage(100000);
		end
	end
end

function event_death_complete(e)
	eq.spawn2(212420, 0, 0, 0, -815, 244, 128);
	eq.signal(212420, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

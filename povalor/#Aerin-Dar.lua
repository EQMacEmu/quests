local PLANAR_PROJECTION_TYPE = 208207;
local MINION_TYPE = 208175; -- A_Mindless_Minion
local RAHLGON_TYPE = 208176; -- Rahlgon 
local SPAWNIDS = {
	347220, 347221,
	347219, 347217,
	347216, 347215,
	347218, 347214, 347213
};

function WakeUp(...)
	local npc;
	local elist = eq.get_entity_list();
	local i = 1;
	local idx = select(i, ...);
	while (idx) do
		if ( SPAWNIDS[idx] ) then
			npc = elist:GetSpawnByID(SPAWNIDS[idx]):GetNPC();
			if ( npc.valid ) then
				npc:SetSpecialAbility(24, 0); -- Will Not Aggro off
				npc:SetSpecialAbility(35, 0); -- No Harm from Players off
				npc:SetBodyType(1, false);	-- Humanoid
			end
		end
		i = i + 1;
		idx = select(i, ...);
	end
end

function RespawnAdds()
	local elist = eq.get_entity_list();
	for _, id in ipairs(SPAWNIDS) do
		elist:GetSpawnByID(id):SetTimer(1);
	end
end

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, 360, 2528, 39, 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function event_spawn(e)
	eq.set_next_hp_event(85);
	RespawnAdds();
end

function event_hp(e)

	if ( e.hp_event == 85 ) then
		eq.set_next_hp_event(65);
		WakeUp(1, 2);
		
	elseif ( e.hp_event == 65 ) then
		eq.set_next_hp_event(45);
		WakeUp(3, 4);
		
	elseif ( e.hp_event == 45 ) then
		eq.set_next_hp_event(25);
		WakeUp(5, 6);
		
	elseif ( e.hp_event == 25 ) then
		WakeUp(7, 8, 9);		
	end
end

function event_combat(e)
	if ( not e.joined and e.self:GetHPRatio() < 86 ) then
		eq.set_timer("checkhp", 3000);
	end
	if ( e.joined ) then
		eq.set_timer("boundscheck", 3000);
	else
		eq.stop_timer("boundscheck");
	end
end
		
function event_timer(e)

	if ( e.timer == "boundscheck" ) then
		if ( e.self:GetZ() > 120 or e.self:GetY() < 2100 or e.self:GetY() > 2880 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end
		
	elseif ( e.timer == "checkhp" ) then
	
		if ( e.self:GetHPRatio() == 100 ) then
			eq.stop_timer(e.timer);
			eq.set_next_hp_event(85);
			eq.depop_all(MINION_TYPE);
			eq.depop_all(RAHLGON_TYPE);
			RespawnAdds();
		end
	end
end

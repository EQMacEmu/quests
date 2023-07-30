local KARANA_TYPE = 209136;
local JOLUR_TYPE = 209147; -- Jolur_Sandstorm
local EKIL_TYPE = 209142; -- Ekil_Thundercall
local OLJIN_TYPE = 209148; -- Oljin_Stormtide
local HIBDIN_TYPE = 209146; -- Hibdin_Cyclone

local ADD_TYPES = {
	[JOLUR_TYPE] = 1,
	[EKIL_TYPE] = 1,
	[OLJIN_TYPE] = 1,
	[HIBDIN_TYPE] = 1,
	[209124] = 1, -- A_firestorm
	[209123] = 1, -- A_comet
	[209125] = 1, -- A_hurricane
	[209130] = 1, -- A_storm_cloud
};

function SpawnGiant(id)
	eq.unique_spawn(id, 0, 0, -1070, -1739, 2257, 64);
end

function event_combat(e)
	if ( e.joined ) then
		eq.zone_emote(0, "Agnarr the Storm Lord says 'Fool! This is the realm of the Storm Giants now, and you hope to defeat me here?'");
		eq.set_timer("portals", 120000);
		eq.set_timer("link", 45000);
		if ( e.self:GetHPRatio() > 96 ) then
			eq.set_next_hp_event(75);
			eq.set_timer("spawn", 3000);
		end
	else
		eq.stop_timer("portals");
		eq.stop_timer("link");
	end
end

function event_timer(e)

	if ( e.timer == "link" ) then

		if ( e.self:GetZ() < 2200 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end

		local npcList = eq.get_entity_list():GetNPCList();

		for npc in npcList.entries do
		
			if ( npc.valid and ADD_TYPES[npc:GetNPCTypeID()] and e.self:GetTarget() and e.self:GetTarget().valid ) then
				npc:AddToHateList(e.self:GetTarget(), 100);
				
				if ( npc:GetZ() < 2200 ) then
					npc:GMMove(npc:GetSpawnPointX(), npc:GetSpawnPointY(), npc:GetSpawnPointZ(), 0);
				end
			end
		end
	
	elseif ( e.timer == "portals" ) then
		eq.zone_emote(0, "Agnarr strikes his staff to the ground, causing great ripples of energy to rage across the room.");
		eq.signal(209034, 1); -- A_storm_portal
		
		if ( e.self:GetHPRatio() < 25 ) then
			eq.set_timer("portals", 60000);
			
		elseif ( e.self:GetHPRatio() < 50 ) then
			eq.set_timer("portals", 90000);
		end
		
	elseif ( e.timer == "spawn" ) then
		eq.stop_timer(e.timer);
		SpawnGiant(JOLUR_TYPE); -- Jolur_Sandstorm
	end
end

function event_hp(e)

	if ( e.hp_event == 75 ) then
		eq.set_next_hp_event(50);
		SpawnGiant(EKIL_TYPE); -- Ekil_Thundercall
		
	elseif ( e.hp_event == 50 ) then
		eq.set_next_hp_event(25);
		SpawnGiant(OLJIN_TYPE); -- Oljin_Stormtide
	
	elseif ( e.hp_event == 25 ) then
		SpawnGiant(HIBDIN_TYPE); -- Hibdin_Cyclone	
	end
end

function event_death_complete(e)
	eq.spawn2(KARANA_TYPE, 0, 0, -477, -1758, 2355, 192);
	eq.signal(KARANA_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

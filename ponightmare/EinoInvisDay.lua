local BANSHEE_TYPE = 204015; -- a_tortured_banshee
local NIGHTSTALKER_TYPE = 204019; -- a_nightstalker
local HOBGOBLIN_TYPE = 204011; -- a_hobgoblin
local TREMULOUS_BAT_TYPE = 204030; -- a_tremulous_bat
local TERROR_BAT_TYPE = 204042; -- a_terror_bat
local TORMENT_BAT_TYPE = 204031; -- a_torment_bat 

local MOB_TYPES = { [BANSHEE_TYPE] = 1, [NIGHTSTALKER_TYPE] = 1, [HOBGOBLIN_TYPE] = 1, [TREMULOUS_BAT_TYPE] = 1, [TERROR_BAT_TYPE] = 1, [TORMENT_BAT_TYPE] = 1 };

function event_spawn(e)
	eq.debug("EinoInvisDay spawn", 2);
	eq.set_timer("timecheck", 10000);
	
	-- Depop mobs spawned by the Eino escort script.
	-- These are supposed to depop in ~10 minutes of unaggro time, but implementing that precisely would require
	-- a lot of redundant and/or kludgy code due to our lack of a hardcoded despawn timer, so I opted to remove
	-- them this way instead.  The scripted NPCs are the same NPC types of NPCs found elsewhere in the zone but
	-- they are beyond the invisible drop-off wall, so this sould be safe to do.  This will depop them about
	-- 36 minutes after the escort was started.
	local npcList = eq.get_entity_list():GetNPCList();
	
	if ( npcList ) then
		for npc in npcList.entries do
			if ( npc.valid ) then
				if ( MOB_TYPES[npc:GetNPCTypeID()] ) then
					if ( npc:GetX() > 480 and not npc:IsEngaged() ) then
						npc:Depop();
					end
				end
			end
		end
	end
end

function event_timer(e)
	if ( e.timer == "timecheck" ) then
		local zoneTime = eq.get_zone_time()["zone_hour"];
		if ( zoneTime > 19 or zoneTime < 7 ) then
			eq.debug("EinoInvisDay despawn", 2);
			eq.depop_with_timer();
		end
	end
end

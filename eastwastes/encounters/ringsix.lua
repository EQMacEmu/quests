function IcefangWaypoint(e)
	if(e.wp == 2) then
		e.self:Emote("whimpers as he approaches.");
	elseif(e.wp == 3) then
		e.self:SetRunning(true);
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116024)) then
			eq.get_entity_list():GetMobByNpcTypeID(116024):Say("All that remains from that battle is my loyal Icefang. He will not rest until I am avenged. Follow and watch after him. He alone knows where our attackers lie and he cannot overcome them by himself. May Brell bless you with success, farewell.");
		end
	elseif(e.wp == 7) then
		eq.unique_spawn(116026,0,0,-4495,-3319,148,0); -- NPC: Poxbreath_Yellowfang
		eq.spawn2(116027,0,0,-4396,-3380,148,0); -- NPC: an_oracle_of_Ry`Gorr
		eq.spawn2(116027,0,0,-4432,-3323,148,0); -- NPC: an_oracle_of_Ry`Gorr
		eq.spawn2(116027,0,0,-4355,-3363,148,0); -- NPC: an_oracle_of_Ry`Gorr
	end
end

function PoxSpawn(e)
	eq.set_timer("depop",120000);
end

function OracleSpawn(e)
	eq.set_timer("depop",120000);
end

function PoxCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function PoxTimer(e)
	if(e.timer == "depop") then
		eq.depop();
		eq.stop_timer("depop");
	end
end

function OracleCombat(e)
	if(e.joined) then
		eq.get_entity_list():GetMobByNpcTypeID(116026):AddToHateList(e.other,1);
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function OracleTimer(e)
	if(e.timer == "depop") then
		eq.depop();
		eq.stop_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ringsix", Event.waypoint_arrive, 116534, IcefangWaypoint);
	eq.register_npc_event("ringsix", Event.spawn, 116026, PoxSpawn);
	eq.register_npc_event("ringsix", Event.spawn, 116027, OracleSpawn);
	eq.register_npc_event("ringsix", Event.combat, 116026, PoxCombat);
	eq.register_npc_event("ringsix", Event.combat, 116027, OracleCombat);
	eq.register_npc_event("ringsix", Event.timer, 116026, PoxTimer);
	eq.register_npc_event("ringsix", Event.timer, 116027, OracleTimer);
end

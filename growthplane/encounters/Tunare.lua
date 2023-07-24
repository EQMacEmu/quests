function TunareSpawn(e)
	eq.set_timer("SpawnTunare",1000);
end

function TunareTimer(e)
	if(e.timer == "SpawnTunare") then
		eq.stop_timer("SpawnTunare");
		eq.unique_spawn(127001,0,0,-1632,1525,206,0); -- Tunare back in her tree.
	end
end

function TunareSignal(e)
	if(e.signal == 1) then
		eq.unique_spawn(127002,0,0,-247,1609,-40,424); -- NPC: #Tunare
		eq.depop(127001);
	elseif(e.signal == 2) then
		eq.unique_spawn(127001,0,0,-1632,1525,206,0); -- reset Tunare back in her tree.
		eq.depop(127002);
	elseif(e.signal == 3) then
		eq.depop_with_timer(); -- set the respawn timer
	end
end

function TunareCombat(e)
	if (e.joined) then
		eq.signal(127097,1); -- send signal to spawn the 2nd Tunare.
	end
end

function Tunare2Spawn(e)
	eq.set_timer("depop",900000);
end

function Tunare2Timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop")
		eq.signal(127097,2);
	end
end

function Tunare2Combat(e)
	if (e.joined) then
		call_zone_to_assist(e.self,e.other);
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function Tunare2Death(e)
	eq.signal(127097,3);
	eq.stop_timer("depop");
end

function call_zone_to_assist(e_self,e_other)
	-- set to true to enable debug messages
	local show_debug = false;
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- aggro the zone onto whoever attacked me.
	-- do not aggro these mobs #_Tunare (127001), #Tunare (127002), a_warm_light (127004)
	-- #BouncerMan (127097), Prince_Thirneg (127096), a_thifling_focuser (127006 and 127106)
	local exclude_npc_list = Set {127001,127004,127097,127002,127096,127006,127106};
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():MoveTo(e_self:GetX(),e_self:GetY(),e_self:GetZ(),0,false);
					if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is valid, adding hate on " .. npc:GetName() .. "."); end
				else
					if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is invalid, unable to add hate on " .. npc:GetName() .. "."); end
				end
			else
				if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is excluded, not adding hate on " .. npc:GetName() .. "."); end
			end
		end
	end
end

-- Set function example from Programming In Lua
-- http://www.lua.org/pil/11.5.html
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function event_encounter_load(e)
	eq.register_npc_event("Tunare", Event.spawn, 127097, TunareSpawn);
	eq.register_npc_event("Tunare", Event.timer, 127097, TunareTimer);
	eq.register_npc_event("Tunare", Event.signal, 127097, TunareSignal);
	eq.register_npc_event("Tunare", Event.combat, 127001, TunareCombat);
	eq.register_npc_event("Tunare", Event.spawn, 127002, Tunare2Spawn);
	eq.register_npc_event("Tunare", Event.timer, 127002, Tunare2Timer);
	eq.register_npc_event("Tunare", Event.combat, 127002, Tunare2Combat);
	eq.register_npc_event("Tunare", Event.death_complete, 127002, Tunare2Death);
end

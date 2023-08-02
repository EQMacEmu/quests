local ThreadManager = require("thread_manager");
local Zhesz = nil;

function ZheszLecture()
	Zhesz:Say("The Emperor is your god.");
	call_iksar_bow();
	ThreadManager:Wait(0.65);

	Zhesz:Say("You were created from filth by the will of the Emperor");
	call_iksar_bow();
	ThreadManager:Wait(0.65);

	Zhesz:Say("You are no better than filth.  Of no value to the Emperor");
	call_iksar_bow();
	ThreadManager:Wait(0.65);

	Zhesz:Say("Yet only the will of the Emperor keeps you alive");
	call_iksar_bow();
end

function call_iksar_bow()
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- move the mobs to the location that is calling to.
	local include_npc_list = Set {162137}; -- north iksar mob
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (include_npc_list[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():DoAnim(36);
				end
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

function ZheszHeartbeat(e)
		Zhesz = e.self;
	if(e.timer == "start") then
		ThreadManager:Create("ZheszLecture",ZheszLecture)
	elseif(e.timer == "Zhesz_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("ZheszLecture");
	end
end

function ZheszSpawn(e)
	eq.set_timer("start", 144000);
	eq.set_timer("Zhesz_hb", 36000);
end

function ZheszCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("start")) then
			eq.pause_timer("start");
		end
		if(not eq.is_paused_timer("Zhesz_hb")) then
			eq.pause_timer("Zhesz_hb");
		end
	else
		eq.resume_timer("start");
		eq.resume_timer("Zhesz_hb");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ArchTormentor", Event.timer, 162165, ZheszHeartbeat);
	eq.register_npc_event("ArchTormentor", Event.spawn, 162165, ZheszSpawn);
	eq.register_npc_event("ArchTormentor", Event.combat, 162165, ZheszCombat);
end

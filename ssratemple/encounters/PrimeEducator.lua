local ThreadManager = require("thread_manager");
local Ghozik = nil;

function GhozikLecture()
	Ghozik:Say("The Emperor is your god.");
	IksarShoutBow();
	ThreadManager:Wait(0.65);

	Ghozik:Say("You were created from filth by the will of the Emperor");
	IksarShoutBow();
	ThreadManager:Wait(0.65);

	Ghozik:Say("You are no better than filth.  Of no value to the Emperor");
	IksarShoutBow();
	ThreadManager:Wait(0.65);

	Ghozik:Say("Yet only the will of the Emperor keeps you alive");
	IksarShoutBow();
end

function IksarShoutBow()
	eq.get_entity_list():GetMobByNpcTypeID(162234):Emote("shout in unison, 'All praises to our lord!  We are but filth!'");
	call_iksar_bow();
end

function call_iksar_bow()
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- move the mobs to the location that is calling to.
	local include_npc_list = Set {162028}; -- south iksar mob
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

function GhozikHeartbeat(e)
		Ghozik = e.self;
	if(e.timer == "start") then
		ThreadManager:Create("GhozikLecture",GhozikLecture)
	elseif(e.timer == "Ghozik_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("GhozikLecture");
	end
end

function GhozikSpawn(e)
	eq.set_timer("start", 146000);
	eq.set_timer("Ghozik_hb", 36000);
end

function GhozikCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("start")) then
			eq.pause_timer("start");
		end
		if(not eq.is_paused_timer("Ghozik_hb")) then
			eq.pause_timer("Ghozik_hb");
		end
	else
		eq.resume_timer("start");
		eq.resume_timer("Ghozik_hb");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("PrimeEducator", Event.timer, 162179, GhozikHeartbeat);
	eq.register_npc_event("PrimeEducator", Event.spawn, 162179, GhozikSpawn);
	eq.register_npc_event("PrimeEducator", Event.combat, 162179, GhozikCombat);
end

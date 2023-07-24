local TRAP_SPAWNS = {
	[218341] = { 218348, 218351, 218006 }, -- TrapMan1, A Needlescale Hatchling, A Prismatic Basilisk, A_Needlescale_Basilisk
	[218399] = { 218352, 218377, 218238 }, -- TrapMan2, A Magical Collection of Dust, The Living Earth, An_Earthern_Crusader
	[218400] = { 218349, 218381, 218011 }, -- TrapMan3, A Tenacious Arborean, Calris Bristlebranch, An Unkempt Arborean
	[218401] = { 218350, 218384, 218004 }, -- TrapMan4, A Young Frog, A Korascian Warlord, A_Korascian_Hunter
	[218402] = { 218347, 218378, 218005 }, -- TrapMan5, A Small Rockmonster, A Pristine Gem Golem, A_Gemmed_Guardian
	[218403] = { 218344, 218386, 218001 }, -- TrapMan6, A Glass Formation, A Shimmering Gem Sentry, A_Majestic_Gemwalker
	[218404] = { 218346, 218385, 218034 }, -- TrapMan7, A Gemmed Rock Man, A Perfect Rock Formation, A_Gemmed_Protector
	[218405] = { 218345, 218379, 218002 }, -- TrapMan8, A Young Cave Genoid, Glimmerstone, A_Crystalline_Formation
	[218406] = { 218354, 218380, 218016 }, -- TrapMan9, An Unfinished Stonewalker, Galsinak Earthrumble, A_Stone_Abomination
	[218407] = { 218355, 218368, 218008 }, -- TrapMan10, A Earth Initiate, Tribal Leader Diseranon, A_Fearsome_Earthcrafter
	[218408] = { 218356, 218382, 218025 }, -- TrapMan11, A Vekerchiki Drone, An Ancient Vekerchiki Champion, A_Vekerchiki_Warrior
	[218409] = { 218353, 218376, 218000 }, -- TrapMan12, A Mudfilled Earth Golem, A Monsterous Earthwalker, An_Earthen_Mudslinger
	[218410] = { 218417, 218417, 218417 }, -- TrapMan13, A Decaying Spelunker
};

local counters = {};

function TrapCombat(e)

	if ( e.joined ) then
	
		local myType = e.self:GetNPCTypeID();
		local t = TRAP_SPAWNS[myType][1];
	
		-- skeleton traps don't trigger every time
		if ( myType == 218410 ) then
			if ( math.random(5) < 5 ) then
				return;
			end
		end
		
		if ( not counters[myType] ) then
			counters[myType] = 1;
		else
			counters[myType] = counters[myType] + 1;
		end
		
		if ( counters[myType] >= 5 ) then
		
			if ( math.random(2) == 1 ) then
				t = TRAP_SPAWNS[myType][2];
			else
				t = TRAP_SPAWNS[myType][3];
			end
			counters[myType] = 0;
		end		

		if ( TRAP_SPAWNS[myType] ) then
			eq.spawn2(t, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
		end
		eq.depop_with_timer();
	end
end

function MobSpawn(e)
	eq.set_timer("depop", 1200000);
end

function MobCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function MobTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_encounter_load(e)
	for id, spawns in pairs(TRAP_SPAWNS) do
		eq.register_npc_event("Traps", Event.combat, id, TrapCombat);
		
		eq.register_npc_event("Traps", Event.spawn, spawns[1], MobSpawn);
		eq.register_npc_event("Traps", Event.spawn, spawns[2], MobSpawn);
		eq.register_npc_event("Traps", Event.combat, spawns[1], MobCombat);
		eq.register_npc_event("Traps", Event.combat, spawns[2], MobCombat);
		eq.register_npc_event("Traps", Event.timer, spawns[1], MobTimer);
		eq.register_npc_event("Traps", Event.timer, spawns[2], MobTimer);
	end
end

local GUREBK_TYPE = 210332; -- Gurebk,_Lord_of_Krendic
local ADDS_TYPES = { -- these are level 56 versions; not the same as zone wanderers
	210482, -- a_roving_scorpioco
	210483, -- a_noxious_scorponnis
	210485, -- a_roving_cactore
	210484, -- a_spined_cactoric
};
local TRASH_GIANT_TYPES = {
	210035, -- a_jotna_fannsk (SK)
	210407, -- a_jotna_fannsk (warrior)
	210022, -- a_jotna_her_megir
};
local killed = 0;
local adds = 0;
local gurebkActive = false;

function TrashDeathCompleteEvent(e)

	local elist = eq.get_entity_list();
	
	if ( not elist:IsMobSpawnedByNpcTypeID(GUREBK_TYPE) ) then
		return;
	end
	
	killed = killed + 1;
	if ( killed < 34 ) then
		return;
	end
	
	for _, id in ipairs(TRASH_GIANT_TYPES) do
		if ( elist:IsMobSpawnedByNpcTypeID(id) ) then
			return;
		end
	end
	
	local gurebk = elist:GetNPCByNPCTypeID(GUREBK_TYPE);

	if ( gurebk and gurebk.valid ) then
		gurebk:SetBodyType(1, false);   -- make targetable
		gurebk:SetSpecialAbility(24, 0); -- Will Not Aggro off
		gurebk:SetSpecialAbility(35, 0); -- No Harm from Players off
		eq.set_timer("untarget", 3600000, gurebk);
		gurebkActive = true;
		adds = 0;
		eq.debug("Gurebk active");
	end
end

-- this is actually how Sony does it; just depops them instantly if they spawn
function TrashSpawnEvent(e)
	if ( gurebkActive ) then
		eq.depop_with_timer();
	end
end

function GurebkDeathEvent(e)
	gurebkActive = false;
	eq.debug("Gurebk killed");
end

function GurebkSpawnEvent(e)
	gurebkActive = false;
	killed = 0;
end

function GurebkTimerEvent(e)
	if ( e.timer == "adds" ) then
	
		if ( adds < 6 ) then
		
			local x = e.self:GetX();
			local y = e.self:GetY();
			local z = e.self:GetZ() + 5;
			local rng = math.random(4, 6);
			local spawned = 0;
			
			for i = adds+1, 6 do
				eq.spawn2(eq.ChooseRandom(ADDS_TYPES[1], ADDS_TYPES[2], ADDS_TYPES[3], ADDS_TYPES[4]), 0, 0, x + math.random(-100, 100), y + math.random(-100, -50), z, 0);				
				spawned = spawned + 1;
				if ( spawned == rng ) then
					break;
				end
			end
			adds = adds + spawned;
		end
	
	elseif ( e.timer == "untarget" ) then
		eq.stop_timer(e.timer);
		e.self:SetBodyType(11, false);   -- make untargetable
		e.self:SetSpecialAbility(24, 1); -- Will Not Aggro on
		e.self:SetSpecialAbility(35, 1); -- No Harm from Players on
		killed = 0;
		gurebkActive = false;
		eq.debug("Gurebk inactive");
	end
end

function GurebkCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("untarget");
		eq.set_timer("adds", 20000);
	else
		eq.resume_timer("untarget");
		eq.stop_timer("adds");
	end
end

function AddSpawnEvent(e)
	eq.set_timer("depop", 170000);
end
function AddTimerEvent(e)
	if ( e.timer == "depop" ) then
		adds = adds - 1;
		eq.depop();
	end
end
function AddCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end
function AddDeathEvent(e)
	adds = adds - 1;
end

function event_encounter_load(e)

	for _, id in ipairs(TRASH_GIANT_TYPES) do
		eq.register_npc_event("Gurebk", Event.death_complete, id, TrashDeathCompleteEvent);
		eq.register_npc_event("Gurebk", Event.spawn, id, TrashSpawnEvent);
	end

	eq.register_npc_event("Gurebk", Event.death, GUREBK_TYPE, GurebkDeathEvent);
	eq.register_npc_event("Gurebk", Event.spawn, GUREBK_TYPE, GurebkSpawnEvent);
	eq.register_npc_event("Gurebk", Event.timer, GUREBK_TYPE, GurebkTimerEvent);
	eq.register_npc_event("Gurebk", Event.combat, GUREBK_TYPE, GurebkCombatEvent);
	
	for _, id in ipairs(ADDS_TYPES) do
		eq.register_npc_event("Gurebk", Event.spawn, id, AddSpawnEvent);
		eq.register_npc_event("Gurebk", Event.timer, id, AddTimerEvent);
		eq.register_npc_event("Gurebk", Event.combat, id, AddCombatEvent);
		eq.register_npc_event("Gurebk", Event.death, id, AddDeathEvent);
	end
end

-- Field 1 mobs have a chance to be snare immune.  doing this instead of duplicating all of the types

local TYPES = {
	217048, -- an_obsidian_tree_spider
	217455, -- an_obsidian_tree_spider
	217002, -- an_obsidian_tree_spiderling
	217423, -- a_fiery_spirit_steed
	217007, -- a_jopal_hunter
	217028, -- a_jopal_gatherer
	217029, -- a_flame_lord
	217006, -- a_flame_lordling
	217047, -- a_jopal_lavahurler
};

function SpawnEvent(e)
	if ( math.random(5) == 1 ) then
		e.self:SetSpecialAbility(16, 1); -- Snare
	end
end

function event_encounter_load(e)
	for _, id in pairs(TYPES) do
		eq.register_npc_event("SnareImmunity", Event.spawn, id, SpawnEvent);
	end
end
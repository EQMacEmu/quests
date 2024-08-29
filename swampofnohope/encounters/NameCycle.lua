local CYCLEMOBS = {
83001,
83003,
83005,
83006,
83007,
83008,
83009,
83011,
83012,
83014,
83016,
83017,
83023,
83024,
83025,
83027,
83028,
83029,
83032,
83057,
83060,
83068,
83075,
83076,
83077,
83078,
83079,
83081,
83082,
83083,
83084,
83085,
83086,
83087,
83088,
83089,
83090,
83195,
83239,
83455
};

function CycleSpawn(e)
	local myType = e.self:GetNPCTypeID();
	local sp = e.self:GetSpawnPointID();
	local spawn = eq.get_entity_list():GetSpawnByID(sp);
	if (math.random(100) > 5) then
		spawn:SetRespawnTimer(6); -- 6 seconds
		eq.debug("NPC ID: ".. myType .. " Spawnpoint ID: ".. sp .. " spawn is 6 second",1);
	else
		spawn:SetRespawnTimer(259200); -- 3 days
		eq.debug("NPC ID: ".. myType .. " Spawnpoint ID: ".. sp .. " spawn is 3 days",1);
	end
end

function event_encounter_load(e)
	for _, MobCycle in ipairs(CYCLEMOBS) do
		eq.register_npc_event("NameCycle", Event.spawn, MobCycle, CycleSpawn);
	end
end

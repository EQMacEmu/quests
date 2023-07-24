local REAVER_LOCS = {
	{ 413, 115 },
	{ 387, 129 },
	{ 388, 153 },
	{ 420, 151 },
};

function SpawnReavers(mob, noEmote)
	for i, coords in ipairs(REAVER_LOCS) do
		eq.spawn2(200259, 0, 0, coords[1], coords[2], -60, 128); -- Reanimated_Reaver 
	end
	if ( not noEmote ) then
		eq.get_entity_list():MessageClose(mob, true, 200, 0, "Maniacal laughter echoes around the room as the ancient dark lich uses the freshly dead body to summon forth even more reanimated reavers.");
	end
end

function event_hate_list(e)
	if ( not e.joined and e.self:GetHP() > 0 ) then
		SpawnReavers(e.self);
	end
end

function event_spawn(e)
	eq.set_timer("depop", 11700000);
	SpawnReavers(e.self, true);
end

function event_timer(e)
	eq.depop();
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_death_complete(e)
	eq.zone_emote(0, "The menacing voice is heard once again saying, 'Betrayer and desecrator of storms I call upon you to end the lives of these fools.");
	eq.unique_spawn(200228, 0, 0, 258, 84, -70, 0); -- #Bishop_Toluwon
end

local BROWN_TYPES = {
	48089, -- a_Thul_Tae_Ew_zealot
	48383, -- A_Thul_Tae_Ew_Tracker
	48398, -- a_Thul_Tae_Ew_protector
	48106, -- a_Thul_Tae_Ew_lifestealer
	48084, -- a_Thul_Tae_Ew_justicar 
	48054, -- a_Thul_Tae_Ew_judicator
	48401, -- A_Thul_Tae_Ew_Hunter
	48382, -- A_Thul_Tae_Ew_Hunter
	48109, -- a_Thul_Tae_Ew_fanatic
	48083, -- a_Thul_Tae_Ew_defender
	48103, -- a_Thul_Tae_Ew_bloodcaller
};
function event_encounter_load(e)

	for _, id in ipairs(BROWN_TYPES) do
		eq.register_npc_event("BlackOoze", Event.death, id, function(e)
			if ( math.random(1, 2) == 1 ) then
				eq.spawn2(48371, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
			end
		end);
	end
end

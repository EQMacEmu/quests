local WARDER_TYPES = {
	[158444] = 158418,			-- Kaas_Thox_Xi_Ans_Dyek, _Akhevan_Warder
	[158443] = 158409,			-- Diabo_Xi_Xin_Thall, __Akhevan_Warder
	[158441] = 158405,			-- Diabo_Xi_Va_Temariel, ___Akhevan_Warder
	[158442] = 158405,			-- Thall_Xundraux_Diabo, ___Akhevan_Warder
	[158440] = 158399,			-- Va_Xi_Aten_Ha_Ra, ____Akhevan_Warder 
	[158439] = 158393			-- Thall_Va_Kelun, _____Akhevan_Warder
};

function BossDeathEvent(e)
	
	local npcList = eq.get_entity_list():GetNPCList();
	
	if ( npcList ) then
	
		for npc in npcList.entries do

			if ( npc.valid and npc:GetNPCTypeID() == WARDER_TYPES[e.self:GetNPCTypeID()] ) then
				npc:Depop(true);	-- depop with timer
			end
		end
	end

end

function event_encounter_load(e)

	for bossType, warderType in pairs(WARDER_TYPES) do
		eq.register_npc_event("warders", Event.death, bossType, BossDeathEvent);
	end
end

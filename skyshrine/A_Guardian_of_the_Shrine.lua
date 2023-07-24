local SLEEPER_TYPE = 128094; -- #The_Sleeper
local SHOUT_TYPES = { 114618, 114508, 114435, 114564, 114434, 114501, 114014 };

function event_signal(e)
	if ( e.signal == 1 ) then
		eq.debug("Sleeper timer started");
		
		local npc;
		for i, id in ipairs(SHOUT_TYPES) do
			npc = eq.get_entity_list():GetNPCByNPCTypeID(id);
			if ( npc and npc.valid ) then
			
				if ( i == 1 ) then -- Yelinak
					eq.get_entity_list():MessageClose(npc, true, 1500, 0, npc:GetCleanName().." shouts, 'BEWARE!  The Sleeper has been awakened!  Flee the shrine immediately, it intends death to all here!'");
				else
					eq.get_entity_list():MessageClose(npc, true, 600, 0, npc:GetCleanName().." shouts, 'BEWARE!  BEWARE!  The Sleeper has been awakened!  He means death for all who remain here!  Time is short, flee the Skyshrine now if you value your life!'");
				end
			end
		end

		eq.set_timer("sleeper", 600000);
	end
end

function event_timer(e)
	eq.stop_timer(e.timer);
	if ( e.timer == "sleeper" ) then
		eq.set_timer("repop", 86400000);
		
		eq.spawn2(SLEEPER_TYPE, 0, 0, -328, 447, 46, 0, "Kerafyrm");
		
		local npcList = eq.get_entity_list():GetNPCList();
		for npc in npcList.entries do
		
			if ( npc.valid and npc:GetPrimaryFaction() == 430 ) then -- Claws of Veeshan
				npc:SetNPCAggro(true);
			end
		end
		
		local spawnList = eq.get_entity_list():GetSpawnList();
		for spawn in spawnList.entries do
			spawn:Disable(false);
		end
		
	elseif ( e.timer == "repop" ) then
		local spawnList = eq.get_entity_list():GetSpawnList();
		for spawn in spawnList.entries do
			spawn:Enable();
		end
		eq.debug("zone spawns enabled");
	end
end

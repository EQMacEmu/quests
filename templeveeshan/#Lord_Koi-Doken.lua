-- #Lord_Koi`Doken NPCID: 124103

function event_spawn(e)
	eq.spawn2(124157, 0, 0, -679, 509, 129, 194); -- a_guardian_spirit 
end

function event_death(e)

	local npc_list = eq.get_entity_list():GetNPCList();
	
	if ( npc_list ) then
		for npc in npc_list.entries do
			if ( npc:GetNPCTypeID() == 124157 and npc:GetX() == -679 and npc:GetY() == 509 ) then
				npc:Depop();
				break;
			end
		end
	end
end

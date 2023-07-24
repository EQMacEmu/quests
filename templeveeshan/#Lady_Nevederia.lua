-- #Lady_Nevederia NPCID: 124076

function event_spawn(e)
	eq.spawn2(124157, 0, 0, -795, 564, 129, 104); -- a_guardian_spirit 
end

function event_death(e)

	local npc_list = eq.get_entity_list():GetNPCList();
	
	if ( npc_list ) then
		for npc in npc_list.entries do
			if ( npc:GetNPCTypeID() == 124157 and npc:GetX() == -795 and npc:GetY() == 564 ) then
				npc:Depop();
				break;
			end
		end
	end
end

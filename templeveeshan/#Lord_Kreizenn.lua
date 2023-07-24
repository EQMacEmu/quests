-- #Lord_Kreizenn NPCID: 124074

function event_spawn(e)
	eq.spawn2(124157, 0, 0, -810, 509, 129, 64); -- a_guardian_spirit 
end

function event_death(e)

	local npc_list = eq.get_entity_list():GetNPCList();
	
	if ( npc_list ) then
		for npc in npc_list.entries do
			if ( npc:GetNPCTypeID() == 124157 and npc:GetX() == -810 and npc:GetY() == 509 ) then
				npc:Depop();
				break;
			end
		end
	end
end

function event_combat(e)

	if (e.joined) then
		eq.set_timer("help", 300000);
		HelpMe(e);
	else
		eq.stop_timer("help");
	end
end

function event_timer(e)
	if(e.timer == "help") then
		HelpMe(e);
	end
end

function HelpMe(e)
	local aaryonar = eq.get_entity_list():GetMobByNpcTypeID(124010);
	
	if (aaryonar.valid) then
		aaryonar:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
end

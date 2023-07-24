function event_combat(e)

	if ( e.joined ) then
		HelpMe(e);
		eq.set_timer("help", 300000);
	else
		eq.stop_timer("help");
	end
end

function event_timer(e)

	if ( e.timer == "help" ) then
		e.self:Shout("Undogo, oldogo, gaba, daga!");
		HelpMe(e);
	end
end

function HelpMe(e)

	local helpers = {
		[127027] = 1,	-- an_entoling_culler
		[127103] = 1,	-- an_entoling_essence_channeler
		[127026] = 1,	-- an_entoling_harvester
	};
	
	local list = eq.get_entity_list():GetNPCList();
	
	if ( list ) then
	
		for npc in list.entries do
		
			if ( helpers[npc:GetNPCTypeID()] and npc.valid ) then			
				npc:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
			end
		end
	end
end

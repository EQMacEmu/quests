-- this script will reset adds that are pulled to a lower floor

local ADD_TYPES = { 162115, 162112, 162114, 162113, 162121, 162119, 162122, 162120, 162118, 162116, 162117, 162111 };

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("check", 10000);
	else
		eq.stop_timer("check");
	end
end

function event_timer(e)
	if ( e.timer == "check" ) then
	
		local elist = eq.get_entity_list();
		local npc;
		
		for _, typ in ipairs(ADD_TYPES) do
			npc = elist:GetMobByNpcTypeID(typ):CastToNPC();
			if ( npc and npc.valid and npc:GetZ() < 240 ) then
				npc:GMMove(npc:GetSpawnPointX(), npc:GetSpawnPointY(), npc:GetSpawnPointZ(), npc:GetSpawnPointH());
				npc:CastSpell(3230, npc:GetID()); -- Balance of the Nameless
				npc:WipeHateList();
				return; -- do one at a time to fuck with them
			end
		end
	end
end

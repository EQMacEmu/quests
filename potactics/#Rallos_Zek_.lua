local CORPSE_TYPES = { [214007] = 1, [214008] = 1, [214009] = 1, [214010] = 1, [214011] = 1 };

function GetCorpse()
	local npcList = eq.get_entity_list():GetNPCList();
	
	for npc in npcList.entries do
	
		if ( npc.valid ) then
		
			if ( CORPSE_TYPES[npc:GetNPCTypeID()] ) then
				return npc;
			end
		end			
	end
end

function DepopCorpses()
	local npcList = eq.get_entity_list():GetNPCList();
	
	for npc in npcList.entries do
	
		if ( npc.valid ) then
		
			if ( CORPSE_TYPES[npc:GetNPCTypeID()] ) then
				npc:Depop(true);
			end
		end			
	end
end

function GetWraith()
	local npcList = eq.get_entity_list():GetNPCList();
	
	for npc in npcList.entries do
	
		if ( npc.valid ) then
		
			if ( npc:GetNPCTypeID() == 214305 ) then -- level 63 a_War_Wraith
				local spawnId = npc:GetSpawnPointID();
				if ( spawnId == 361197 or spawnId == 361205 or 361205 == 361211 ) then -- arena spawns
					return npc;
				end
			end
		end			
	end
end

function event_spawn(e)
	eq.set_timer("corpses", 60000);
end

function event_timer(e)
	if ( e.timer == "corpses" ) then
	
		local roll = math.random(100);
		local corpse, spawn;
		
		if ( roll < 60 ) then
			corpse = GetCorpse();
			if ( corpse and corpse.valid ) then
				eq.get_entity_list():MessageClose(corpse, true, 150, 0, "A corpse is renewed by the power of Rallos.  It has taken up arms in the eternal battle once more.");
				spawn = eq.spawn2(eq.ChooseRandom(214015, 214017, 214021, 214090), 29, 0, corpse:GetX(), corpse:GetY(), corpse:GetZ(), 0); -- a_Gladiator
				spawn:CastToNPC():SetWaypointPause();
				eq.set_timer("depop", 300000, spawn);
				corpse:Depop(true);
			end
			
		elseif ( roll < 85 ) then
			corpse = GetCorpse();
			if ( corpse and corpse.valid ) then
				eq.get_entity_list():MessageClose(corpse, true, 150, 0, "A corpse is rent by the power of Zek.  It has been found lacking.");
				spawn = eq.spawn2(214078, 29, 0, corpse:GetX(), corpse:GetY(), corpse:GetZ(), 0); -- A_tortured_soul
				spawn:CastToNPC():SetWaypointPause();
				eq.set_timer("depop", 300000, spawn);
				corpse:Depop(true);
			end
		else
			corpse = GetWraith();
			if ( corpse and corpse.valid ) then
				eq.get_entity_list():MessageClose(corpse, true, 150, 0, "A War Wraith raises its hands and begins to howl.  The bodies of the fallen are torn asunder as the judgement of Zek consumes them.");
			end
			DepopCorpses();
		end
		
		eq.set_timer(e.timer, math.random(15, 180) * 1000);
	end
end

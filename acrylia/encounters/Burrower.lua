local Phase = 0;

function HatchlingSpawn(e)
	eq.set_timer("Cycle",43200000);
	eq.set_timer("Burrow",1000);
end

function HatchlingTimer(e)
	local qglobals = eq.get_qglobals();
	
	if(e.timer == "Cycle") then
		Phase = Phase + 1;
		if(Phase == 1) then
			eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
			eq.delete_global("Burrower");
			eq.set_global("Burrower","1",7,"F");
		elseif(Phase == 2) then
			eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
			eq.delete_global("Burrower");
			eq.set_global("Burrower","2",7,"F");
		elseif(Phase == 3) then
			eq.unique_spawn(154013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Worm
			eq.delete_global("Burrower");
			eq.set_global("Burrower","3",7,"F");
		elseif(Phase == 4) then
			eq.unique_spawn(154014,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Crawler
			eq.delete_global("Burrower");
			eq.set_global("Burrower","4",7,"F");
		elseif(Phase == 5) then
			eq.unique_spawn(154015,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Burrower
			eq.delete_global("Burrower");
			eq.set_global("Burrower","5",7,"F");
		elseif(Phase == 6) then
			eq.unique_spawn(154016,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Restless
			eq.delete_global("Burrower");
			eq.set_global("Burrower","6",7,"F");
			eq.set_timer("Cycle",345600000);
		elseif(Phase == 7) then
			eq.unique_spawn(154017,0,0,-796,-161,-9,111); -- Escaped
			eq.delete_global("Burrower");
			eq.set_global("Burrower","7",7,"F");
			eq.stop_timer("Cycle");
		end
	elseif(e.timer == "Burrow") then
		if ( qglobals["Burrower"] and qglobals["Burrower"] ~= nil ) then
			if( qglobals["Burrower"] == "1" ) then
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				Phase = 1;
			elseif( qglobals["Burrower"] == "2" ) then
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
				Phase = 2;
			elseif( qglobals["Burrower"] == "3" ) then
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
				eq.unique_spawn(154013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Worm
				Phase = 3;
			elseif( qglobals["Burrower"] == "4" ) then
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
				eq.unique_spawn(154013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Worm
				eq.unique_spawn(154014,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Crawler
				Phase = 4;
			elseif( qglobals["Burrower"] == "5" ) then
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
				eq.unique_spawn(154013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Worm
				eq.unique_spawn(154014,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Crawler
				eq.unique_spawn(154015,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Burrower
				Phase = 5;
			elseif( qglobals["Burrower"] == "6" ) then
				eq.set_timer("Cycle",345600000);
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
				eq.unique_spawn(154013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Worm
				eq.unique_spawn(154014,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Crawler
				eq.unique_spawn(154015,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Burrower
				eq.unique_spawn(154016,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Restless
				Phase = 6;
			elseif( qglobals["Burrower"] == "7" ) then
				eq.stop_timer("Cycle");
				eq.unique_spawn(154011,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Larva
				eq.unique_spawn(154012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Pupa
				eq.unique_spawn(154013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Worm
				eq.unique_spawn(154014,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Crawler
				eq.unique_spawn(154015,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Burrower
				eq.unique_spawn(154016,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Restless
				eq.unique_spawn(154017,0,0,-796,-161,-9,111); -- Escaped
			end
		end
		eq.stop_timer("Burrow");
	elseif(e.timer == "EscapedSpawn") then
		eq.stop_timer("EscapedSpawn");
		eq.unique_spawn(154017,0,0,-796,-161,-9,111); -- Escaped
	end
end

function HatchlingSignal(e)
	if(e.signal == 1) then
		eq.set_timer("EscapedSpawn",math.random(79200000,93600000));
	elseif(e.signal == 2) then
		eq.stop_timer("Cycle");
		eq.stop_timer("EscapedSpawn");	
	end
end

function BurrowerDeath(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(154016) == false) then -- check to see if restless is not spawned
		RestartCycle(e)
	end
end

function RestlessDeath(e)
	RestartCycle(e)
end

function EscapedCombat(e)
	if(e.joined) then
		eq.set_timer("depop",5000);
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function Escapedtimer(e)
	if(e.timer == "depop") then
		eq.signal(154097,1);
		eq.depop();
	end
end

function Escapeddeath(e)
	eq.signal(154097,1);
end

function RestartCycle(e)
	Phase = 0;
	eq.signal(154097,2);
	eq.depop(154017);
	eq.depop(154014);
	eq.depop(154013);
	eq.depop(154012);
	eq.depop(154011);
	eq.depop_with_timer(154097);
	eq.delete_global("Burrower");
end

function event_encounter_load(e)
	if(eq.get_rule("World:AdjustRespawnTimes") == "true") then
		eq.delete_global("Burrower");
	end
	eq.register_npc_event("Burrower", Event.spawn, 154097, HatchlingSpawn);
	eq.register_npc_event("Burrower", Event.timer, 154097, HatchlingTimer);
	eq.register_npc_event("Burrower", Event.signal, 154097, HatchlingSignal);
	eq.register_npc_event("Burrower", Event.death, 154015, BurrowerDeath);
	eq.register_npc_event("Burrower", Event.death, 154016, RestlessDeath);
	eq.register_npc_event("Burrower", Event.combat, 154017, EscapedCombat);
	eq.register_npc_event("Burrower", Event.death, 154017, Escapeddeath);
	eq.register_npc_event("Burrower", Event.timer, 154017, Escapedtimer);
end

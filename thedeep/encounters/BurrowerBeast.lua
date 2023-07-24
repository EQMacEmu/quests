local ringActive = false;
local wave = 0;

function BeastSpawn(e)
	eq.set_proximity(e.self:GetX()-100,e.self:GetX()+165,e.self:GetY()-325,e.self:GetY()+225,e.self:GetZ()-10,e.self:GetZ()+50);
	ringActive = false;
end

function BeastEnter(e)
	if ( e.other:GetGM()) then
		return
	end
	if ( not ringActive and eq.get_entity_list():IsMobSpawnedByNpcTypeID(164098)) then
		eq.zone_emote(0,"The ground shakes momentarily.  You sense motion beneath the surface on which you are standing.");
		ringActive = true;
		eq.set_timer("wave",10000);
		eq.set_timer("proximity",2000);
	end
end

function BeastTimer(e)
	if ( not ringActive ) then
		eq.stop_timer("wave");
		eq.stop_timer("proximity");
		return;
	end
	if(e.timer == "wave") then
		wave = wave + 1;
		if(wave == 1) then
			eq.unique_spawn(164012,0,0,1561,284,-53,64);
			SpawnFirstType()
			eq.set_timer("wave",192000);
		elseif(wave <= 3) then
			SpawnFirstType();
			eq.set_timer("wave",240000);
		elseif(wave <= 6) then
			SpawnSecondType()
			eq.set_timer("wave",240000);
		elseif(wave == 7) then
			SpawnThirdType();
			eq.set_timer("wave",480000);
		elseif(wave == 8) then
			eq.spawn2(164011,9,0,1790,20,-77,250);
			eq.stop_timer("wave");
		end
	elseif(e.timer == "proximity") then
		if ( CountClientsInRing() == 0 ) then
			eq.set_timer("endring",120000);
			eq.stop_timer("wave");
			eq.stop_timer("proximity");
		end
	elseif(e.timer == "endring") then
		eq.set_timer("resetevent",600000);
		eq.stop_timer("endring");
		EndRingEvent();	
	elseif(e.timer == "resetevent") then
		eq.stop_timer("resetevent");
		RingReset();
	end
end

function BeastDeath(e)
	eq.depop_with_timer(164098);
	EndRingEvent();
end

function EndRingEvent()
	eq.depop(164012);
end

function RingReset()
	wave = 0;
	ringActive = false;
end

function CountClientsInRing()
	local clientList = eq.get_entity_list():GetClientList();
	local clients = 0;

	if ( clientList ) then
		for client in clientList.entries do
		
			if ( not client:GetGM() and not client:GetFeigned()
				and client:GetY() > 170 and client:GetY() < 350
				and client:GetX() > 1675 and client:GetX() < 1850
				and client:GetZ() > -100	and client:GetZ() < 50
			) then
				
				clients = clients + 1;
			end
		end
	end

	return clients;
end

function SpawnFirstType()
	eq.spawn2(164005,9,0,1837,146,-33,240);
	eq.spawn2(164005,9,0,1671,165,-21,29);
	eq.spawn2(eq.ChooseRandom(164005,164006,164007),9,0,1649,233,-32,48);
	eq.spawn2(164005,9,0,1666,392,-17,88);
	eq.spawn2(164005,9,0,1747,392,-27,118);
	eq.spawn2(eq.ChooseRandom(164005,164006,164007),9,0,1847,403,-36,162);
	eq.spawn2(164005,9,0,1870,389,-21,150);
	eq.spawn2(164005,9,0,1882,321,-32,192);
	eq.spawn2(eq.ChooseRandom(164005,164006,164007),9,0,1903,160,-16,226);
	eq.spawn2(164005,9,0,1852,206,-67,222);
	eq.spawn2(164005,9,0,1770,294,-59,50);
	eq.spawn2(eq.ChooseRandom(164005,164006,164007),9,0,1790,20,-77,250);
end

function SpawnSecondType()
	eq.spawn2(164009,9,0,1837,146,-33,240);
	eq.spawn2(164009,9,0,1649,233,-32,48);
	eq.spawn2(164009,9,0,1666,392,-17,88);
	eq.spawn2(164009,9,0,1747,392,-27,118);
	eq.spawn2(164009,9,0,1903,160,-16,226);
	eq.spawn2(164009,9,0,1770,294,-59,50);
end

function SpawnThirdType()
	eq.spawn2(164010,9,0,1790,20,-77,250);
	eq.spawn2(164010,9,0,1810,20,-77,250);
end

function event_encounter_load(e)
	eq.register_npc_event("BurrowerBeast", Event.spawn, 164116, BeastSpawn);
	eq.register_npc_event("BurrowerBeast", Event.enter, 164116, BeastEnter);
	eq.register_npc_event("BurrowerBeast", Event.timer, 164116, BeastTimer);
	eq.register_npc_event("BurrowerBeast", Event.death, 164011, BeastDeath);
end

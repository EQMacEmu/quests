local coterie_event = 0;

function JohaniusWaypoint(e)
	if(e.wp == 15) then
		eq.unique_spawn(172006,0,0,-377,1268,-28,0);
		eq.unique_spawn(172005,0,0,-366,1254,-28,0);
		eq.signal(172136,1);
		coterie_event = 1;
	end
end

function JohaniusSignal(e)
	if(e.signal == 1) then
		eq.set_timer("kill",660000);
	elseif(e.signal == 2) then
		coterie_event = 0;
		eq.stop_timer("kill");
	end
end

function JohaniusTimer(e)
	if(e.timer == "kill") then
		eq.depop_with_timer(172032);
		eq.depop(172005);
		eq.depop(172006);
		coterie_event = 0;
		eq.stop_timer("kill");
	end
end

function Johanius2Waypoint(e)
	Lyrra = eq.get_entity_list():GetMobByNpcTypeID(172005);
	Aellana = eq.get_entity_list():GetMobByNpcTypeID(172006);
	if(e.wp == 4) then
		e.self:Say("We had best save our sentiments for later and make haste back to the safety of Katta Castellum!");
	elseif(e.wp == 5) then
		if(Aellana.valid and Lyrra.valid) then
			Aellana:Say("Dearest brother, how releaved I am to see you again!");
			Aellana:CastToNPC():AssignWaypoints(8);
			Lyrra:Say("Johanius my love! You and your companions have rescued us from those horrible creatures!");
			Lyrra:CastToNPC():AssignWaypoints(8);
		else
			eq.depop(172005);
			eq.depop(172006);
			eq.depop(172007);
		end
	elseif(e.wp == 25) then
		e.self:Say("Hurry inside the gates ladies I will be in shortly after rewarding the brave individuals that assisted me in your rescue.");
	elseif(e.wp == 26) then
		eq.unique_spawn(172008,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function LyrraWaypoint(e)
	if(e.wp == 21) then
		e.self:Say("We will see you at home Johanius, please hurry.");
	end
end

function AellanaWaypoint(e)
	if(e.wp == 21) then
		e.self:Say("We will see you at home Johanius, please hurry.");
	end
end

function CoterieDeath(e)
	local Johanius = eq.get_entity_list():GetMobByNpcTypeID(172032);
	if(coterie_event == 1 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172003) == false 
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172041) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172020) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172044) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172032)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172005)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172006)) then
		eq.unique_spawn(172007,7,0,Johanius:CastToNPC():GetX(),Johanius:CastToNPC():GetY(),Johanius:CastToNPC():GetZ(),Johanius:CastToNPC():GetHeading());
		eq.depop_with_timer(172032);
		eq.signal(172136,2);
	end
end

function Coterie1Death(e)
	local Johanius = eq.get_entity_list():GetMobByNpcTypeID(172032);
	if(coterie_event == 1 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172003) == false 
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172020) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172044) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172032)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172005)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172006)) then
		eq.unique_spawn(172007,7,0,Johanius:CastToNPC():GetX(),Johanius:CastToNPC():GetY(),Johanius:CastToNPC():GetZ(),Johanius:CastToNPC():GetHeading());
		eq.depop_with_timer(172032);
		eq.signal(172136,2);
	end
end

function Coterie2Death(e)
	local Johanius = eq.get_entity_list():GetMobByNpcTypeID(172032);
	if(coterie_event == 1 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172003) == false 
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172041) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172044) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172032)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172005)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172006)) then
		eq.unique_spawn(172007,7,0,Johanius:CastToNPC():GetX(),Johanius:CastToNPC():GetY(),Johanius:CastToNPC():GetZ(),Johanius:CastToNPC():GetHeading());
		eq.depop_with_timer(172032);
		eq.signal(172136,2);
	end
end

function Coterie3Death(e)
	local Johanius = eq.get_entity_list():GetMobByNpcTypeID(172032);
	if(coterie_event == 1 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172003) == false 
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172041) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172020) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172032)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172005)
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(172006)) then
		eq.unique_spawn(172007,7,0,Johanius:CastToNPC():GetX(),Johanius:CastToNPC():GetY(),Johanius:CastToNPC():GetZ(),Johanius:CastToNPC():GetHeading());
		eq.depop_with_timer(172032);
		eq.signal(172136,2);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("johanius", Event.waypoint_arrive, 172032, JohaniusWaypoint);
	eq.register_npc_event("johanius", Event.signal, 172136, JohaniusSignal);
	eq.register_npc_event("johanius", Event.timer, 172136, JohaniusTimer);
	eq.register_npc_event("johanius", Event.waypoint_arrive, 172007, Johanius2Waypoint);
	eq.register_npc_event("johanius", Event.waypoint_arrive, 172005, LyrraWaypoint);
	eq.register_npc_event("johanius", Event.waypoint_arrive, 172006, AellanaWaypoint);
	eq.register_npc_event("johanius", Event.death_complete, 172003, CoterieDeath);
	eq.register_npc_event("johanius", Event.death_complete, 172041, Coterie1Death);
	eq.register_npc_event("johanius", Event.death_complete, 172020, Coterie2Death);
	eq.register_npc_event("johanius", Event.death_complete, 172044, Coterie3Death);
end

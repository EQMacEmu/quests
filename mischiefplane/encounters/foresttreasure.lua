local switch = 0;

function TreasureSpawn(e)
	eq.set_timer("rotate",47000);
	e.self:SetRunspeed(0);
	e.self:SetWalkspeed(0);
end

function TreasureCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("rotate")) then
			eq.pause_timer("rotate");
		end
	else
		eq.resume_timer("rotate");
	end
end

function TreasureTimer(e)
	Pela = eq.get_entity_list():GetMobByNpcTypeID(126271);
	Klia = eq.get_entity_list():GetMobByNpcTypeID(126164);
	Xnyl = eq.get_entity_list():GetMobByNpcTypeID(126237);
	Mnyup = eq.get_entity_list():GetMobByNpcTypeID(126267);
	if(e.timer == "rotate") then
		switch = switch + 1;
		if(switch == 1) then
			e.self:Say("Go First");
			Pela:CastToNPC():MoveTo(697,-410,94,166,true);
			Klia:CastToNPC():MoveTo(721,-383,94,237,true);
			Xnyl:CastToNPC():MoveTo(735,-404,94,33,true);
			Mnyup:CastToNPC():MoveTo(715,-422,94,93,true);
		elseif(switch == 2) then
			e.self:Say("Go Two");
			Pela:CastToNPC():MoveTo(715,-422,94,93,true);
			Klia:CastToNPC():MoveTo(697,-410,94,166,true);
			Xnyl:CastToNPC():MoveTo(721,-383,94,237,true);
			Mnyup:CastToNPC():MoveTo(735,-404,94,33,true);
		elseif(switch == 3) then
			e.self:Say("Go Three");
			Pela:CastToNPC():MoveTo(721,-383,94,237,true);
			Klia:CastToNPC():MoveTo(735,-404,94,33,true);
			Xnyl:CastToNPC():MoveTo(715,-422,94,93,true);
			Mnyup:CastToNPC():MoveTo(697,-410,94,166,true);
			switch = 0;
		end
	end
end

function PelaSay(e)
	if(e.message:findi("hail")) then
		if(math.random(100) < 40) then
			eq.get_entity_list():GetMobByNpcTypeID(126343):AddToHateList(e.other,1);
		end
	end
end

function KliaSay(e)
	if(e.message:findi("hail")) then
		if(math.random(100) < 40) then
			eq.get_entity_list():GetMobByNpcTypeID(126343):AddToHateList(e.other,1);
		end
	end
end

function XnylSay(e)
	if(e.message:findi("hail")) then
		if(math.random(100) < 40) then
			eq.get_entity_list():GetMobByNpcTypeID(126343):AddToHateList(e.other,1);
		end
	end
end

function MnyupSay(e)
	if(e.message:findi("hail")) then
		if(math.random(100) < 40) then
			eq.get_entity_list():GetMobByNpcTypeID(126343):AddToHateList(e.other,1);
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event("foresttreasure", Event.spawn, 126343, TreasureSpawn);
	eq.register_npc_event("foresttreasure", Event.combat, 126343, TreasureCombat);
	eq.register_npc_event("foresttreasure", Event.timer, 126343, TreasureTimer);
	eq.register_npc_event("foresttreasure", Event.say, 126271, PelaSay);
	eq.register_npc_event("foresttreasure", Event.say, 126164, KliaSay);
	eq.register_npc_event("foresttreasure", Event.say, 126237, XnylSay);
	eq.register_npc_event("foresttreasure", Event.say, 126267, MnyupSay);
end

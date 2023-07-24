local ThreadManager = require("thread_manager");
local Iverson = nil;

function IversonOrders()
	Iverson:Shout("Soldiers, Fall in!");
	SoldierSay();
	ThreadManager:Wait(0.65);

	Iverson:Say("At ease, soldiers! You know why you are here! You are here because you want to be the best. You are here to receive special operations training! And I am here to give it to you.");
	ThreadManager:Wait(0.65);

	Iverson:Say("By now, you know that the other company within the battalion has been dispatched to battle. While they are away on march, our mission is twofold. One is to protect these Halls until they return, or our assistance is needed. And the second phase, is to ready ourselves for the possibilities of battle! We are to become stronger, faster, and more diverse in our knowledge then we have ever been before! Each squad in this company will be mastering a different tactic, to be practiced here, and only used on the battlefield, should it be necessary.");
	ThreadManager:Wait(0.65);

	Iverson:Say("Are you ready for this task, soldiers?");
	GoStand();
	SoldierSay1();
	ThreadManager:Wait(0.65);

	Iverson:Say("Allright then, we will reconvene here in one hour to start your training. Dismissed!");
	SoldierSay2()
end

function SoldierSay()
	eq.get_entity_list():GetMobByNpcTypeID(211035):Say("Yes sir! Sergeant Iverson, sir!"); -- Emrol_Sentaru
	eq.get_entity_list():GetMobByNpcTypeID(211035):Say("Yes sir! Sergeant Iverson, sir!"); -- Emrol_Sentaru
	eq.get_entity_list():GetMobByNpcTypeID(211036):Say("Yes sir! Sergeant Iverson, sir!"); -- Kalrok_Mantorns
	eq.get_entity_list():GetMobByNpcTypeID(211036):Say("Yes sir! Sergeant Iverson, sir!"); -- Kalrok_Mantorns
	eq.get_entity_list():GetMobByNpcTypeID(211037):Say("Yes sir! Sergeant Iverson, sir!"); -- Minok_Targsk
	eq.get_entity_list():GetMobByNpcTypeID(211037):Say("Yes sir! Sergeant Iverson, sir!"); -- Minok_Targsk
end

function SoldierSay1()
	eq.get_entity_list():GetMobByNpcTypeID(211035):Say("Sir! Yes, sir!"); -- Emrol_Sentaru
	eq.get_entity_list():GetMobByNpcTypeID(211036):Say("Sir! Yes, sir!"); -- Kalrok_Mantorns
	eq.get_entity_list():GetMobByNpcTypeID(211037):Say("Sir! Yes, sir!"); -- Minok_Targsk
end

function SoldierSay2()
	eq.get_entity_list():GetMobByNpcTypeID(211035):Say("Yes, sir! Thank you, sir!"); -- Emrol_Sentaru
	eq.get_entity_list():GetMobByNpcTypeID(211036):Say("Yes, sir! Thank you, sir!"); -- Kalrok_Mantorns
	eq.get_entity_list():GetMobByNpcTypeID(211037):Say("Yes, sir! Thank you, sir!"); -- Minok_Targsk
end

function GoStand()

	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(211035)) then
		eq.get_entity_list():GetMobByNpcTypeID(211035):CastToNPC():MoveTo(-1345,-197,7.5,0,true); -- Emrol_Sentaru
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(211036)) then
		eq.get_entity_list():GetMobByNpcTypeID(211036):CastToNPC():MoveTo(-1309,-197,7.5,0,true); -- Kalrok_Mantorns
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(211037)) then
		eq.get_entity_list():GetMobByNpcTypeID(211037):CastToNPC():MoveTo(-1264,-197,7.5,0,true); -- Minok_Targsk
	end

end

function GoSit()
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(211035)) then
		eq.get_entity_list():GetMobByNpcTypeID(211035):CastToNPC():MoveTo(-1234,-260,7.5,41,true); -- Emrol_Sentaru
		eq.signal(211035,1);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(211036)) then
		eq.get_entity_list():GetMobByNpcTypeID(211036):CastToNPC():MoveTo(-1199,-247,7.5,225,true); -- Kalrok_Mantorns
		eq.signal(211036,1);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(211037)) then
		eq.get_entity_list():GetMobByNpcTypeID(211037):CastToNPC():MoveTo(-1403,-221,7.5,38,true); -- Minok_Targsk
		eq.signal(211037,1);
	end
end

function EmrolSignal(e)
	if(e.signal == 1) then
		eq.set_timer("sit",1000);
	elseif(e.signal == 2) then
		eq.stop_timer("sit");
	end
end

function KalrokSignal(e)
	if(e.signal == 1) then
		eq.set_timer("sit",1000);
	elseif(e.signal == 2) then
		eq.stop_timer("sit");
	end
end

function MinokSignal(e)
	if(e.signal == 1) then
		eq.set_timer("sit",1000);
	elseif(e.signal == 2) then
		eq.stop_timer("sit");
	end
end

function EmrolTimer(e)
	if(e.timer == "sit" and e.self:GetX() == -1234 and e.self:GetY() == -260) then
		if(e.self:GetAppearance() == 0) then
			e.self:SetAppearance(1);
		end
	end
end

function KalrokTimer(e)
	if(e.timer == "sit" and e.self:GetX() == -1199 and e.self:GetY() == -247) then
		if(e.self:GetAppearance() == 0) then
			e.self:SetAppearance(1);
		end
	end
end

function MinokTimer(e)
	if(e.timer == "sit" and e.self:GetX() == -1403 and e.self:GetY() == -221) then
		if(e.self:GetAppearance() == 0) then
			e.self:SetAppearance(1);
		end
	end
end

function IversonHeartbeat(e)
	Iverson = e.self;
	if(e.timer == "start") then
		ThreadManager:Create("IversonOrders",IversonOrders)
		eq.set_timer("Iversion_hb", 13000);
	elseif(e.timer == "Iversion_hb") then
		eq.stop_timer("start");
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("IversonOrders");
	elseif(e.timer == "gosit") then
		eq.stop_timer("gosit");
		eq.set_timer("canceltimer",30000);
		GoSit();
	elseif(e.timer == "canceltimer") then
		eq.signal(211035,2);
		eq.signal(211036,2);
		eq.signal(211037,2);
		eq.stop_timer("canceltimer");
	end
end

function IversonArrive(e)
	if(e.wp == 1) then
		eq.set_timer("start", 35000);
	elseif(e.wp == 2) then
		eq.stop_timer("Iversion_hb");
	end
end

function IversonDepart(e)
	if(e.wp == 1) then
		if(math.random(100) < 50) then
			eq.set_timer("gosit",75000);
		end
	end
end

function IversonCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("start")) then
			eq.pause_timer("start");
		end
		if(not eq.is_paused_timer("Iversion_hb")) then
			eq.pause_timer("Iversion_hb");
		end
	else
		eq.resume_timer("start");
		eq.resume_timer("Iversion_hb");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("IversonOrders", Event.timer, 211046, IversonHeartbeat);
	eq.register_npc_event("IversonOrders", Event.waypoint_arrive, 211046, IversonArrive);
	eq.register_npc_event("IversonOrders", Event.waypoint_depart, 211046, IversonDepart);
	eq.register_npc_event("IversonOrders", Event.combat, 211046, IversonCombat);
	eq.register_npc_event("IversonOrders", Event.signal, 211035, EmrolSignal);
	eq.register_npc_event("IversonOrders", Event.signal, 211036, KalrokSignal);
	eq.register_npc_event("IversonOrders", Event.signal, 211037, MinokSignal);
	eq.register_npc_event("IversonOrders", Event.timer, 211035, EmrolTimer);
	eq.register_npc_event("IversonOrders", Event.timer, 211036, KalrokTimer);
	eq.register_npc_event("IversonOrders", Event.timer, 211037, MinokTimer);
end

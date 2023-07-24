local ThreadManager = require("thread_manager");
local ronodun = nil;

function ronodunConversation()
	ronodun:Say("Hullo, Petcas. Four dwarven ales please. Line 'em up for me, I need to knock 'em down quick.");
	ThreadManager:Wait(0.65);
	
	local Petcas = eq.get_entity_list():GetMobByNpcTypeID(115141);
	if(Petcas.valid) then
		Petcas:Say("What's the rush there, youngster?")
	end
	
	ronodun:Say("Long story, Pet. I was studying with Grand Historian Thoridain's daughter last week. Outta nowhere she came and kissed me right on the mouth! Just then her father walked in and wouldn't listen when I tried to explain.");
	ThreadManager:Wait(0.65);

	if(Petcas.valid) then
		Petcas:Say("That's not good, the Grand Historian's mighty protective of his daughter. What he do after he caught ya?")
	end

	ronodun:Say("He went and told the Dain himself! I was summoned to the throne the next day where his highness sentenced me to a month of Thoridain's sermons. I just now managed to sneak away for a little refreshment.");
	eq.set_timer("hiccup",4000);
	ThreadManager:Wait(0.65);

	if(Petcas.valid) then
		Petcas:Say("Well, coulda been worse. A month's worth of sermons is a far sight better than a trip to the bottom of the Dain's well.");
	end
	ThreadManager:Wait(0.65);
	
	if(Petcas.valid) then
		Petcas:Say("Here ya go, Ronodun, on the house this time. Drink fast, don't need the Grand Historian to come lookin' fer ya...");
	end

	ronodun:Say("Thank ye, Pet. Yer most kind.");
	ThreadManager:Wait(0.65);
	
	if(Petcas.valid) then
		Petcas:Say("My pleasure, son. You just remember to keep me in all those prayers you'll be sayin this month. Hahhahah!");
	end	
end

function ronodunWaypoint(e)
	ronodun = e.self;
	if(e.wp == 1) then
		ronodun:SetAppearance(1);
		ronodun:Emote("belches");
	elseif(e.wp == 23) then
		ThreadManager:Create("ronodunConversation", ronodunConversation);
	elseif(e.wp == 45) then
		ronodun:SetAppearance(1);
	end
end

function ronodunHeartbeat(e)
	ronodun = e.self;
	if(e.timer == "ronodun_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("ronodunConversation");
	end
	if(e.timer == "hiccup") then
		ronodun:Emote("hiccups!");
		eq.stop_timer("hiccup");
	end
end

function ronodunSpawn(e)
	eq.set_timer("ronodun_hb", 8000);
end

function event_encounter_load(e)
	eq.register_npc_event("ronodun", Event.waypoint_arrive, 115019, ronodunWaypoint);
	eq.register_npc_event("ronodun", Event.timer, 115019, ronodunHeartbeat);
	eq.register_npc_event("ronodun", Event.spawn, 115019, ronodunSpawn);
end

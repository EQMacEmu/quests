local ThreadManager = require("thread_manager");
local Emissary = nil;

function EmissaryConversation()
	Emissary:Say("Ahh, good to see you my little friend, I was beginning to think something had happened to you.");
	ThreadManager:Wait(0.65);
	
	local Rodrick = eq.get_entity_list():GetMobByNpcTypeID(116141);
	if(Rodrick.valid) then
		Rodrick:Say("I had to take extra measures to be sure I wasn't followed. I sense that someone is on to me. You know I am risking my life for this.")
	end
	Emissary:Say("You are just a paranoid little man, Rodrick. That's not your fault, it's in your blood. It's what makes your kind weak and unworthy. As for the risk, that's what you're paid so well for.");
	ThreadManager:Wait(0.65);

	if(Rodrick.valid) then
		Rodrick:Say("Yes, the rewards have been most generous... But what good is money if I am discovered by the Dain? After the massacre he is already suspicious and...")
	end
	Emissary:Emote("interrupts Rodrick, 'Chief Ry`gorr himself told me to assure you that the time draws near. When the Kromrif invade Thurgadin there will be no more Dain. The citizens will be enslaved and you will be placed upon the throne to govern over them.'");
	ThreadManager:Wait(0.65);

	if(Rodrick.valid) then
		Rodrick:Say("Okay, okay, please do not tell the chief of my anxiety")
	end
	Emissary:Say("You have my word, now what news do you bring?");
	ThreadManager:Wait(0.65);

	if(Rodrick.valid) then
		Rodrick:Say("You have taken a prisoner, one that is very dear to the Dain. His name is Corbin Blackwell.")
	end
	Emissary:Say("Yes, our interrogators are working with him now. He is sure to have some valuable information forthcoming any time now.");
	ThreadManager:Wait(0.65);

	if(Rodrick.valid) then
		Rodrick:Say("You had better hurry with him, the Dain has made his recovery a top priority. A team of elite Coldain will be attempting to rescue him in a matter of hours.")
	end
	Emissary:Say("Very well, we will be prepared. Again you have come through for the chief. This will not be forgotten. We will contact you again soon.");

end

function EmissaryWaypoint(e)
	Emissary = e.self;
	if(e.wp == 1) then
		Emissary:Say("Where is that sniveling little worm?");
	elseif(e.wp == 2) then
		Emissary:Say("He was supposed to be here hours ago!");
	elseif(e.wp == 3) then
		Emissary:Say("I don't know why the chief tolerates this insolent fool. If he is discovered he'll betray us for sure.");
	elseif(e.wp == 4) then
		Emissary:Say("If he makes me wait another minute I'll gut him myself...");
	elseif(e.wp == 5) then
		eq.unique_spawn(116141,0,0,1056,-3405,150,199); -- NPC: Rodrick_Tardok
	elseif(e.wp == 6) then
		ThreadManager:Create("EmissaryConversation", EmissaryConversation);
	end
end

function EmissaryHeartbeat(e)
	Emissary = e.self;
	if(e.timer == "Emissary_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("EmissaryConversation");
	end
end

function EmissarySpawn(e)
	eq.set_timer("Emissary_hb", 4000);
end

function RodrickSpawn(e)
	eq.set_timer("depop",200000);
end

function RodrickCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function RodrickTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_encounter_load(e)
	eq.register_npc_event("rodrick", Event.waypoint_arrive, 116025, EmissaryWaypoint);
	eq.register_npc_event("rodrick", Event.timer, 116025, EmissaryHeartbeat);
	eq.register_npc_event("rodrick", Event.spawn, 116025, EmissarySpawn);
	eq.register_npc_event("rodrick", Event.spawn, 116141, RodrickSpawn);
	eq.register_npc_event("rodrick", Event.combat, 116141, RodrickCombat);
	eq.register_npc_event("rodrick", Event.timer, 116141, RodrickTimer);
end

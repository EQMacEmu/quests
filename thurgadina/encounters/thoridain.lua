local ThreadManager = require("thread_manager");
local thoridain = nil;

function thoridainLecture()
	thoridain:Say("We are taught from day one that the truth lies underfoot. It is simple common sense then, that the taller a being is, the farther his mind and heart are from the truth. Always be wary of those larger in stature than us.")
	eq.signal(115197,1, 6000); -- NPC: Bintain
	ThreadManager:Wait(0.65);

	thoridain:Say("If we Coldain just work together, obeying Brell's teachings, nothing can stop us from overcoming our enemies. Even the Kromrif will fall before us if we are undivided. It is only when we stray from our fundamental knowledge that we are vulnerable.")
	ThreadManager:Wait(0.65);

	thoridain:Say("Allow me to share a short story from my youth. It begins when I was just tail high to a snow bunny. Instead of tending to my studies, I snuck out and participated in what was then our 300th annual snowball fighting tournament...")
	eq.signal(115191,1, 6000); -- NPC: Doriggan
	ThreadManager:Wait(0.65);

	thoridain:Say("I have an important announcement to make today. The Dain has heard rumor of a faction of our brethren who openly oppose the crown. If you come forth with any information leading to the discovery of any such traitorous vermin you will be richly rewarded. Their fate most certainly lies at the bottom of the well.")
end

function thoridainHeartbeat(e)
		thoridain = e.self;
	if(e.timer == "start") then
		ThreadManager:Create("thoridainLecture",thoridainLecture)
	elseif(e.timer == "thoridain_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("thoridainLecture");
	end
end

function thoridainSpawn(e)
	eq.set_timer("start", 360000);
	eq.set_timer("thoridain_hb", 90000);
end

function dorigganWaypoint(e)
	if(e.wp == 5) then
		eq.stop();
		e.self:SetAppearance(1);
	end
end

function bintainSignal(e)
	e.self:Say("That explains why the dern Kromrif are so thickheaded...");
	eq.signal(115194,1, 6000); -- NPC: Arikain
end

function arikainSignal(e)
	e.self:Emote("whispers into Lorran's ear, 'He's so wise, no wonder the Dain made him Grand Historian.'");
end

function dorigganSignal(e)
	if(e.signal == 1) then
		e.self:Emote("snores loudly");
		eq.signal(115021,1, 6000); -- NPC: Durfa
	elseif(e.signal == 2) then
		e.self:Say("OWW!");
		eq.signal(115135,1, 14000); -- NPC: Grand_Historian_Thoridain
	elseif(e.signal == 3) then
		e.self:Say("Yes, Grand Historian Thoridain");
		eq.start(11);
	end
end

function durfaSignal(e)
	if(e.signal == 1) then
		e.self:Emote("pinches Doriggan");
		eq.signal(115191,2); -- NPC: Doriggan
	end
end

function thoridainSignal(e)
	e.self:Say("Young Doriggan, perhaps you will find it easier to focus on my words from a standing position. That corner will do fine.");
	eq.signal(115191,3); -- NPC: Doriggan
end

function event_encounter_load(e)
	eq.register_npc_event("thoridain", Event.timer, 115135, thoridainHeartbeat);
	eq.register_npc_event("thoridain", Event.spawn, 115135, thoridainSpawn);
	eq.register_npc_event("thoridain", Event.waypoint_arrive, 115191, dorigganWaypoint);
	eq.register_npc_event("thoridain", Event.signal, 115197, bintainSignal);
	eq.register_npc_event("thoridain", Event.signal, 115194, arikainSignal);
	eq.register_npc_event("thoridain", Event.signal, 115191, dorigganSignal);
	eq.register_npc_event("thoridain", Event.signal, 115021, durfaSignal);
	eq.register_npc_event("thoridain", Event.signal, 115135, thoridainSignal);
end

local ThreadManager = require("thread_manager");
local Autarkic = nil;

function AutarkicLecture()
	local Incanter = eq.get_entity_list():GetMobByNpcTypeID(160160);
	local Praecantor = eq.get_entity_list():GetMobByNpcTypeID(160142);
	local Theurgus = eq.get_entity_list():GetMobByNpcTypeID(160133);

	Autarkic:Say("Meddling fleshlings! Why have you pulled back to this forsaken castellum? Do you fear that I will seek vengeance on Nathyn Illuminious and the city that shelters him for my years of captivity here? Or do you seek something more dangerous, knowledge of the dark path of shadows?");
	ThreadManager:Wait(0.65);

	if(Incanter.valid) then
		Incanter:Say("We neither fear you nor seek to be drawn into your dark ways, Lord Sfarosh. You will provide us some information as demanded by the Magistrates of the Loyalist Empire. The questions are simple, answer quickly and the sooner you shall be freed from this summoning. What is your history with the alchemist Valdanov Zevfeer?");
	end
	ThreadManager:Wait(0.65);

	Autarkic:Say("A simple question indeed. I simply supplied him with Akhevan blood for his experimentation, that is all. The Order of Autarkic Umbrage is no friend of the Akheva and it was possible that his research could uncover some useful information for my order. Valdanovs own motivation for his experimentation was none of my concern, but the outcome is quite fascinating I must admit.");
	ThreadManager:Wait(0.65);

	if(Praecantor.valid) then
		Praecantor:Say("So it seems you are aware of the outcome of his hidden experimentation. Care to enlighten us as to what that outcome was?");
	end
	ThreadManager:Wait(0.65);
	
	Autarkic:Say("I am amazed at how little you fleshlings know of what occurs within the very walls of your own castellum. It is known by my Order that Akhevan blood has strange mutagenic effects on the bodies of non-akheves if introduced to their circulatory systems. The process by which the Shadow Tegi are infused with the blood is quite complicated and painful but I would deduce that a vampyre like Valdanov merely had to ingest the blood for the mutagenic agents to effect his physiology, causing the permenent change into what I believe you call a Vampyre Volatilis. I have no dealings with Valdanov since his mutation as I was imprisoned in Nathyns mansion until freed by these foolish fleshings.");
	ThreadManager:Wait(0.65);
	
	if(Theurgus.valid) then
		Theurgus:Say("How was it that you came to be imprisoned in the mansion of Nathyn Illuminious?");
	end
	ThreadManager:Wait(0.65);

	Autarkic:Say("I was paying a visit to Valdanov with more Akhevan blood, not knowing he had already been banished by Nathyn from Katta Castellum for becoming the monster that he became. I must admit, Nathyn is a powerful and cunning creature. He was prepared for my arrival, captured me with his sorceries, and imprisoned me in that enchanted chest. I was not offered an explanation, nor do I know how he discovered my dealings with Valdanov, I assume he obtained that knowledge from questioning Valdanov about his mutation.");
	ThreadManager:Wait(0.65);

	Autarkic:Say("It seems some allies are arriving! Foolish fleshlings, run while you have the chance!");
	if(Theurgus.valid) then
		Theurgus:CastToNPC():SetAppearance(3);
	end
	if(Praecantor.valid) then
		Praecantor:Say("Ajeea! What's happened?! I sense there are dark powers at work here!");
	end
	if(Incanter.valid) then
		Incanter:Say("The circle of containment is breaking down without Ajeea! Prepare yourselves!");
	end
	ThreadManager:Wait(0.65);
	
	Autarkic:Say("Your feeble fleshling magic has failed you! Your souls shall be slaves of the Order of Autarkic Umbrage!");
	if(Praecantor.valid) then
		Praecantor:Emote("rushes to Ajeea, lifts her comotose body with a magical force and they both vanish in a flash of light.");
		Incanter:Say("Eliminate the shades! Selis and I will get Ajeea to safety and concentrate on a ward to prevent any further intrusion and stifle the shades power! Seek me out and bring me the robes of these shades when they have been slain so that we may research placing a more permanent ward against such creatures on the Conlegium.");
		eq.depop(160133);
		eq.depop(160142);
		eq.depop(160160);
	end
	Autarkic:Say("Attempt to slay me if you so desire, and if you succeed it matters not. I will return as I am a creature of shadows and shadows never die, merely slumber!");
    eq.unique_spawn(160166,0,0,Autarkic:CastToNPC():GetX(),Autarkic:CastToNPC():GetY(),Autarkic:CastToNPC():GetZ(),Autarkic:CastToNPC():GetHeading());  --  #Autarkic_Lord_Sfarosh
	eq.spawn2(160167,0,0,-25,-762,4,160); -- an autarkic umbrage shade
	eq.spawn2(160167,0,0,-164,-760,4,96); -- an autarkic umbrage shade
	eq.spawn2(160167,0,0,-30,-901,4,224); -- an autarkic umbrage shade
	eq.depop(160165);
end

function AutarkicHeartbeat(e)
	Autarkic = e.self;
	if(e.timer == "start") then
		ThreadManager:Create("AutarkicLecture",AutarkicLecture)
		eq.stop_timer("start");
	elseif(e.timer == "Autarkic_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("AutarkicLecture");
	end
end

function AutarkicSpawn(e)
	eq.set_timer("start", 1000);
	eq.set_timer("Autarkic_hb", 7000);
end

function TheurgusSpawn(e)
	eq.set_timer("depop",900000);
end

function TheurgusTimer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop(160142);
		eq.depop(160160);
		eq.depop();
	elseif(e.timer == "starting") then
		local Incanter = eq.get_entity_list():GetMobByNpcTypeID(160160);
		if(Incanter.valid) then
			Incanter:Emote("begins chanting in an arcane language.");
		end
		local Praecantor = eq.get_entity_list():GetMobByNpcTypeID(160142);
		if(Praecantor.valid) then
			Praecantor:Emote("begins chanting in an arcane language.");
		end
		local Theurgus = eq.get_entity_list():GetMobByNpcTypeID(160133);
		if(Theurgus.valid) then
			Theurgus:Emote("begins chanting in an arcane language.");
		end
		eq.unique_spawn(160165,0,0,-97,-822,11,0); -- Autarkic Lord Sfarosh
		eq.stop_timer("starting");
	end
end

function Autarkic2Spawn(e)
	eq.set_timer("depop",740000);
end

function Autarkic2Timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function Autarkic2Combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function umbrageSpawn(e)
	eq.set_timer("depop",740000);
end

function umbrageTimer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function umbrageCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function TheurgusTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7779}, 0)) then
		e.self:Say("Perfect. We shall begin the summoning and questioning. This enchanted scroll will magically scribe all that transpires within its radius of perception. Take it to Magistrate Phenic after the summoning and questioning are completed.");
		e.other:Faction(e.self,1504,5);
		e.other:Faction(e.self,1502,1);
		e.other:Faction(e.self,1503,1);
		e.other:Faction(e.self,1483,-1);
		e.other:Faction(e.self,1484,-1);
		e.other:Faction(e.self,1485,-1);
		e.other:Faction(e.self,1541,-1);
		e.other:QuestReward(e.self,0,0,0,0,7361); -- Enchanted Record of Events
		eq.set_timer("starting",10000);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("vampyre", Event.timer, 160133, TheurgusTimer);
	eq.register_npc_event("vampyre", Event.spawn, 160133, TheurgusSpawn);
	eq.register_npc_event("vampyre", Event.trade, 160133, TheurgusTrade);
	eq.register_npc_event("vampyre", Event.timer, 160165, AutarkicHeartbeat);
	eq.register_npc_event("vampyre", Event.spawn, 160165, AutarkicSpawn);
	eq.register_npc_event("vampyre", Event.spawn, 160166, Autarkic2Spawn);
	eq.register_npc_event("vampyre", Event.timer, 160166, Autarkic2Timer);
	eq.register_npc_event("vampyre", Event.combat, 160166, Autarkic2Combat);
	eq.register_npc_event("vampyre", Event.spawn, 160167, umbrageSpawn);
	eq.register_npc_event("vampyre", Event.timer, 160167, umbrageTimer);
	eq.register_npc_event("vampyre", Event.combat, 160167, umbrageCombat);
end

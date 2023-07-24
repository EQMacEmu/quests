local ThreadManager = require("thread_manager");
local Lyneea = nil;

function LyneeaLecture()
	Lyneea:Say("You ready for some coppers Olam? I've got a fresh mug of Loyalist Ale waitin ta be drunk!");
	ThreadManager:Wait(0.65);

	local olam = eq.get_entity_list():GetMobByNpcTypeID(160223);
	if(olam.valid) then
		olam:Say("All right you begin, I am going to beat you this time!");
	end
	ThreadManager:Wait(0.65);

	Lyneea:Emote("attempts to flip a copper into a mug on the table and misses!");
	ThreadManager:Wait(0.65);

	if(olam.valid) then
		olam:Emote("attempts to flip a copper into a mug on the table and misses!");
	end
	ThreadManager:Wait(0.65);
	
	Lyneea:Emote("attempts to flip a copper into a mug on the table and succeeds!");
	ThreadManager:Wait(0.65);
	
	if(olam.valid) then
		olam:Emote("drinks a gulp of ale 'Nice toss!'");
	end
	ThreadManager:Wait(0.65);
	
	if(olam.valid) then
		olam:Emote("attempts to flip a copper into a mug on the table and succeeds!")
	end
	ThreadManager:Wait(0.65);
	
	Lyneea:Emote("drinks a gulp of ale");
	ThreadManager:Wait(0.65);
	
	Lyneea:Emote("attempts to flip a copper into a mug on the table and succeeds!");
	ThreadManager:Wait(0.65);

	if(olam.valid) then
		olam:Emote("drinks a gulp of ale 'Nice toss!'");
	end
	ThreadManager:Wait(0.65);
	
	if(olam.valid) then
		olam:Emote("attempts to flip a copper into a mug on the table and misses!");
	end
	ThreadManager:Wait(0.65);
	ThreadManager:Wait(0.65);
	ThreadManager:Wait(0.65);
	ThreadManager:Wait(0.65);

	Lyneea:Emote("attempts to flip a copper into a mug on the table and succeeds!");
	ThreadManager:Wait(0.65);

	if(olam.valid) then
		olam:Emote("takes another gulp of ale and begins to look dizzy");
	end
	ThreadManager:Wait(0.65);

	Lyneea:Say("Are you feeling all right?");
	ThreadManager:Wait(0.65);
	
	if(olam.valid) then
		olam:Emote("I'll...be...fine....uhn..");
		olam:CastToNPC():DoAnim(16);
	end
	ThreadManager:Wait(0.65);

	local jacob = eq.get_entity_list():GetMobByNpcTypeID(160257);
	if(jacob.valid) then
		jacob:Say("I hope you're planning on cleaning that spill up for us, Olam!");
	end
	ThreadManager:Wait(0.65);

	Lyneea:Say("You never can hold your liquor Olam!");
end

function LyneeaHeartbeat(e)
		Lyneea = e.self;
	if(e.timer == "start") then
		ThreadManager:Create("LyneeaLecture",LyneeaLecture)
	elseif(e.timer == "Lyneea_hb") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("LyneeaLecture");
	end
end

function LyneeaSpawn(e)
	eq.set_timer("start", 690000);
	eq.set_timer("Lyneea_hb", 8000);
end

function event_encounter_load(e)
	eq.register_npc_event("lyneea", Event.timer, 160219, LyneeaHeartbeat);
	eq.register_npc_event("lyneea", Event.spawn, 160219, LyneeaSpawn);
end

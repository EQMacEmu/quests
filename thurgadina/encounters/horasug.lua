local ThreadManager = require("thread_manager");
local horasug = nil;

function HorasugConversation()
	horasug:Say("My beloved brethren! Hear me now, I have seen a sacred vision...");
	
	local rumagur = eq.get_entity_list():GetMobByNpcTypeID(115187);
	if(rumagur.valid) then
		rumagur:Say("Hey Fronden, I want a double of whatever you've been serving him!");
	end
	ThreadManager:Wait(0.65);

	horasug:Say("In my vision, Brell himself spoke to me! He indicated that the path to true enlightenment could only be found through sobriety. Substances such as alcohol only serve to cloud the mind and keep us from our true destiny!");
	
	local saramor = eq.get_entity_list():GetMobByNpcTypeID(115010);
	if(saramor.valid) then
		saramor:Say("Blasphemer!");
	end	
	
	local froden = eq.get_entity_list():GetMobByNpcTypeID(115014);
	if(froden.valid) then
		froden:Emote("raises an eyebrow at Horasug.");
	end	
	ThreadManager:Wait(0.65);
	horasug:Say("Mock me if you will brothers, I am off to seek audience with the Dain where I will convince him of the evils of liquor. I am sure he will have our taverns serving only water and juice by day's end.");
	
	if(saramor.valid) then
		saramor:Say("Get him boys!");
	end	
	
	local jorumin = eq.get_entity_list():GetMobByNpcTypeID(115188);
	if(jorumin.valid) then
		jorumin:Say("Over my dead body!");
	end	
end

function HorasugBar()
	horasug:Say("Whew, that was a close one!");
	
	local doogle = eq.get_entity_list():GetMobByNpcTypeID(115142);
	if(doogle.valid) then
		doogle:Say("Hello there Horasug! What brings ya here?")
	end
	ThreadManager:Wait(0.65);

	horasug:Say("I had a sacred vision from Brell himself!");
	
	if(doogle.valid) then
		doogle:Say("A vision you say? What exactly was this a vision of?")
	end	
	ThreadManager:Wait(0.65);

	horasug:Emote("thinks for a moment, looking at the roomful of rugged patrons.");
	ThreadManager:Wait(0.65);

	horasug:Say("Heh, I saw meself here at Doogie's Drinks partaking of the finest Coldain ale in the land, of course!");
	
	if(doogle.valid) then
		doogle:Say("Well, you came to the right place, Horasug. A few of these ales will fill you with all the visions you can handle.")
	end	
end

function HorasugWaypoint(e)
	horasug = e.self;
	if(e.wp == 1) then
		ThreadManager:Create("HorasugConversation", HorasugConversation);
	elseif(e.wp == 2) then
		horasug:SetRunning(true);
		horasug:Say("Uh oh");
		local rumagur = eq.get_entity_list():GetMobByNpcTypeID(115187);
		if(rumagur.valid) then
			rumagur:SetRunning(true);
			rumagur:CastToNPC():AssignWaypoints(7);
		end	
		
		local saramor = eq.get_entity_list():GetMobByNpcTypeID(115010);
		if(saramor.valid) then
			saramor:SetRunning(true);
			saramor:CastToNPC():AssignWaypoints(6);
		end	
	
		local jorumin = eq.get_entity_list():GetMobByNpcTypeID(115188);
		if(jorumin.valid) then
			jorumin:SetRunning(true);
			jorumin:CastToNPC():AssignWaypoints(8);
		end	
	elseif(e.wp == 19) then
		horasug:SetRunning(false);
		ThreadManager:Create("HorasugBar", HorasugBar);
	elseif(e.wp == 42) then
		horasug:SetAppearance(1);
	end
end

function HorasugHeartbeat(e)
	if(e.timer == "horasug_hb") then
		horasug = e.self;
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("HorasugConversation");
		ThreadManager:Resume("HorasugBar");
	end
end

function HorasugSpawn(e)
	eq.set_timer("horasug_hb", 9000);
end

function event_encounter_load(e)
	eq.register_npc_event("horasug", Event.waypoint_arrive, 115013, HorasugWaypoint);
	eq.register_npc_event("horasug", Event.timer, 115013, HorasugHeartbeat);
	eq.register_npc_event("horasug", Event.spawn, 115013, HorasugSpawn);
end

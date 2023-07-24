local ThreadManager = require("thread_manager");
local krystorf = nil;

function krystorfDayAnnoucement()
	krystorf:Shout("The Royal Court of Dain Frostreaver IV and his council of advisors is now in session. Those citizens with official business for the crown please report to the throne room at this time.");
	
	local dain1 = eq.get_entity_list():GetMobByNpcTypeID(129003); -- Dain_Frostreaver_IV
	local dain2 = eq.get_entity_list():GetMobByNpcTypeID(129101); -- Dain_Frostreaver_IV
	
	if(dain1.valid) then
		dain1:CastToNPC():MoveTo(5,690,69,128,true);
	end
	if(dain2.valid) then
		dain2:CastToNPC():MoveTo(5,690,69,128,true);
	end
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(129000); -- Seneschal_Aldikar
	if(Aldikar.valid) then
		Aldikar:CastToNPC():MoveTo(-3,693,69,126,true);
	end
	local Amberfeld = eq.get_entity_list():GetMobByNpcTypeID(129073); -- Councilor_Amberfeld
	if(Amberfeld.valid) then
		Amberfeld:CastToNPC():MoveTo(25,542,65,0,true);
	end
	local Coldember = eq.get_entity_list():GetMobByNpcTypeID(129075); -- Councilor_Coldember
	if(Coldember.valid) then
		Coldember:CastToNPC():MoveTo(15,543,66,0,true);
	end
	local Darakor = eq.get_entity_list():GetMobByNpcTypeID(129043); -- Councilor_Darakor
	if(Darakor.valid) then
		Darakor:CastToNPC():MoveTo(-15,544,66,0,true);
	end
	local Darkfrost = eq.get_entity_list():GetMobByNpcTypeID(129078); -- Councilor_Darkfrost
	if(Darkfrost.valid) then
		Darkfrost:CastToNPC():MoveTo(-5,543,66,0,true);
	end
	local Deynekn = eq.get_entity_list():GetMobByNpcTypeID(129074); -- Councilor_Deynekn
	if(Deynekn.valid) then
		Deynekn:CastToNPC():MoveTo(20,534,68,0,true);
	end
	local Dirkins = eq.get_entity_list():GetMobByNpcTypeID(129077); -- Councilor_Dirkins
	if(Dirkins.valid) then
		Dirkins:CastToNPC():MoveTo(0,535,68,0,true);
	end
	local Glacierbane = eq.get_entity_list():GetMobByNpcTypeID(129076); -- Councilor_Glacierbane
	if(Glacierbane.valid) then
		Glacierbane:CastToNPC():MoveTo(5,545,66,0,true);
	end
	local Icelok = eq.get_entity_list():GetMobByNpcTypeID(129038); -- Councilor_Icelok
	if(Icelok.valid) then
		Icelok:CastToNPC():MoveTo(10,535,68,0,true);
	end
	local Icepike = eq.get_entity_list():GetMobByNpcTypeID(129072); -- Councilor_Icepike
	if(Icepike.valid) then
		Icepike:CastToNPC():MoveTo(30,533,68,0,true);
	end
	local Lockheart = eq.get_entity_list():GetMobByNpcTypeID(129045); -- Councilor_Juliah_Lockheart
	if(Lockheart.valid) then
		Lockheart:CastToNPC():MoveTo(-25,542,65,0,true);
	end
	local Thubins = eq.get_entity_list():GetMobByNpcTypeID(129080); -- Councilor_Thubins
	if(Thubins.valid) then
		Thubins:CastToNPC():MoveTo(-20,535,68,0,true);
	end
	local Wintershade = eq.get_entity_list():GetMobByNpcTypeID(129079); -- Councilor_Wintershade
	if(Wintershade.valid) then
		Wintershade:CastToNPC():MoveTo(-10,534,67,0,true);
	end
end

function krystorfNightAnnouncement()
	krystorf:Shout("The Royal Court of Dain Frostreaver the IV is now closed for the night. Those with official business for the crown may return in the morning.");
	
	local dain = eq.get_entity_list():GetMobByNpcTypeID(129003); -- Dain_Frostreaver_IV
	if(dain.valid) then
		dain:CastToNPC():MoveTo(5,769,66,128,true);
	end
	local Amberfeld = eq.get_entity_list():GetMobByNpcTypeID(129073); -- Councilor_Amberfeld
	if(Amberfeld.valid) then
		Amberfeld:CastToNPC():MoveTo(108,665,38,63,true);
	end
	local Coldember = eq.get_entity_list():GetMobByNpcTypeID(129075); -- Councilor_Coldember
	if(Coldember.valid) then
		Coldember:CastToNPC():MoveTo(90,664,39,248,true);
	end
	local Darakor = eq.get_entity_list():GetMobByNpcTypeID(129043); -- Councilor_Darakor
	if(Darakor.valid) then
		Darakor:CastToNPC():MoveTo(-80,666,39,0,true);
	end
	local Darkfrost = eq.get_entity_list():GetMobByNpcTypeID(129078); -- Councilor_Darkfrost
	if(Darkfrost.valid) then
		Darkfrost:CastToNPC():MoveTo(-2,878,-1,40,true);
	end
	local Deynekn = eq.get_entity_list():GetMobByNpcTypeID(129074); -- Councilor_Deynekn
	if(Deynekn.valid) then
		Deynekn:CastToNPC():MoveTo(91,697,39,133,true);
	end
	local Dirkins = eq.get_entity_list():GetMobByNpcTypeID(129077); -- Councilor_Dirkins
	if(Dirkins.valid) then
		Dirkins:CastToNPC():MoveTo(-104,695,39,134,true);
	end
	local Glacierbane = eq.get_entity_list():GetMobByNpcTypeID(129076); -- Councilor_Glacierbane
	if(Glacierbane.valid) then
		Glacierbane:CastToNPC():MoveTo(65,661,39,259,true);
	end
	local Icelok = eq.get_entity_list():GetMobByNpcTypeID(129038); -- Councilor_Icelok
	if(Icelok.valid) then
		Icelok:CastToNPC():MoveTo(66,694,39,136,true);
	end
	local Icepike = eq.get_entity_list():GetMobByNpcTypeID(129072); -- Councilor_Icepike
	if(Icepike.valid) then
		Icepike:CastToNPC():MoveTo(117,691,39,130,true);
	end
	local Lockheart = eq.get_entity_list():GetMobByNpcTypeID(129045); -- Councilor_Juliah_Lockheart
	if(Lockheart.valid) then
		Lockheart:CastToNPC():MoveTo(13,875,-2,236,true);
	end
	local Thubins = eq.get_entity_list():GetMobByNpcTypeID(129080); -- Councilor_Thubins
	if(Thubins.valid) then
		Thubins:CastToNPC():MoveTo(-54,695,39,131,true);
	end
	local Wintershade = eq.get_entity_list():GetMobByNpcTypeID(129079); -- Councilor_Wintershade
	if(Wintershade.valid) then
		Wintershade:CastToNPC():MoveTo(5,887,-2,130,true);
	end
	ThreadManager:Wait(0.65);
	ThreadManager:Wait(0.65);
	
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(129000); -- Seneschal_Aldikar
	if(Aldikar.valid) then
		Aldikar:CastToNPC():MoveTo(6,772,38,130,true);
	end
end

function daySpawn(e)
	ThreadManager:Create("krystorfDayAnnoucement", krystorfDayAnnoucement);
end

function nightSpawn(e)
	ThreadManager:Create("krystorfNightAnnouncement", krystorfNightAnnouncement);
end

function krystorfHeartbeat(e)
	if(e.timer == "krystorf_hb") then
		krystorf = e.self;
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("krystorfDayAnnoucement");
		ThreadManager:Resume("krystorfNightAnnouncement");
	end
end

function krystorfSpawn(e)
	eq.set_timer("krystorf_hb", 10000);
end

function event_encounter_load(e)
	eq.register_npc_event("krystorf", Event.timer, 129028, krystorfHeartbeat);
	eq.register_npc_event("krystorf", Event.spawn, 129028, krystorfSpawn);
	eq.register_npc_event("krystorf", Event.spawn, 129098, daySpawn);
	eq.register_npc_event("krystorf", Event.spawn, 129097, nightSpawn);
end

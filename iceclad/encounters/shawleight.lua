function FirstGeneralSpawn(e)
	eq.set_timer("depop",1800000);
end

function FirstGeneraltimer(e)
	eq.depop();
end

function GeneralWaypoint(e)
	if(e.wp == 2) then
		eq.get_entity_list():GetMobByNpcTypeID(110109):Shout("The tracking wolves have found the Coldain! To the South West, Charge him!");
		eq.spawn2(110025,0,0,7518,-3524,163,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif dire wolf
		eq.spawn2(110020,0,0,7594,-3558,164,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
		eq.spawn2(110020,0,0,7606,-3552,160,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
		eq.spawn2(110020,0,0,7583,-3566,162,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
	elseif(e.wp == 4) then
		eq.spawn2(110022,0,0,7221,-2243,175,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,7237,-2238,176,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,7208,-2254,168,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,7228,-2231,176,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
	elseif(e.wp == 6) then
		eq.spawn2(110023,0,0,5837,-1053,193,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Commander_Kvarid
		eq.spawn2(110022,0,0,5894,-1128,190,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,5905,-1122,191,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,5884,-1139,184,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
	elseif(e.wp == 15) then
		eq.spawn2(110020,0,0,2216,1502,50,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
		eq.spawn2(110020,0,0,2232,1512,54,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
		eq.spawn2(110020,0,0,2206,1495,48,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
		eq.spawn2(110020,0,0,2224,1514,54,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
		eq.spawn2(110020,0,0,2205,1487,51,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Kromrif tracking wolf
	elseif(e.wp == 18) then
		eq.spawn2(110024,0,0,2654,3753,273,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- Commander_Vjorik
		eq.spawn2(110022,0,0,2610,3759,265,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,2624,3722,272,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,2508,3766,264,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
		eq.spawn2(110022,0,0,2599,3748,263,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(110019),1); -- frost_giant_skirmisher
	elseif(e.wp == 24) then
		e.self:Say("Lo there gnomes! Tell me is your camp located nearby?");
		eq.get_entity_list():GetMobByNpcTypeID(110052):Say("Yar ye scruvy bearded dwarf, just over tha hill there.");
		eq.get_entity_list():GetMobByNpcTypeID(110053):Say("Arrrrrrrrrrr!");
	elseif(e.wp == 28) then
		eq.get_entity_list():GetMobByNpcTypeID(110069):CastToNPC():MoveTo(1305,4590,75,64,true);
		eq.signal(110069,1); -- NPC: Captain_Nalot
	elseif(e.wp == 29) then
		eq.get_entity_list():GetMobByNpcTypeID(110069):Say("Hrm? Who is scuffin' around out here?");
		e.self:Say("Greetings Captian Nalot, I have come to you with a proposition to make.");
	elseif(e.wp == 30) then
		eq.get_entity_list():GetMobByNpcTypeID(110069):Say("Arrrrrr what is it ye want?");
		e.self:Say("Well ya see sir, we have a surplus of Velium that we would not mind sharing with you for yer tinkerin' but would ask a favor in return for it.");
	elseif(e.wp == 31) then
		eq.get_entity_list():GetMobByNpcTypeID(110069):Say("Velium eh? Well there matey lets hear what you have got to say!");
		e.self:Say("I represent the Dain in this matter, we would like for you to use yer Icebreaker there to head to Antonica and bring reinforcements for the war that is preparing to ensue. We are needin' all the help we can get against the Kromrif.");
	elseif(e.wp == 32) then
		eq.unique_spawn(110026,0,0,1310,4573,84,0):Emote("s voice echoes through the area. 'The efforts to help the Coldain and bring them together with the gnomes of Iceclad is quite impressive. There will be no doubt that they will continue to increase in power until they can overtake the Giants of Zek. Hey there, what is that on your shoulder?'");
	end
end

function AvatarSpawn(e)
	eq.set_timer("depop",1800000);
end

function AvatarTimer(e)
	eq.depop();
end

function AvatarSay(e)
	if(e.message:findi("runed coldain prayer shawl")) then
		e.self:Say("So it is the sacred rune of the Coldain. Let me have a closer look at it.");
	end
end

function NalotSignal(e)
	eq.set_timer("return",300000);
end

function NalotTimer(e)
	eq.move_to(1325,4639,74,126,true);
	eq.stop_timer("return");
end

function event_encounter_load(e)
	eq.register_npc_event("shawleight", Event.spawn, 110017, FirstGeneralSpawn);
	eq.register_npc_event("shawleight", Event.timer, 110017, FirstGeneraltimer);
	eq.register_npc_event("shawleight", Event.waypoint_arrive, 110019, GeneralWaypoint);
	eq.register_npc_event("shawleight", Event.spawn, 110026, AvatarSpawn);
	eq.register_npc_event("shawleight", Event.timer, 110026, AvatarTimer);
	eq.register_npc_event("shawleight", Event.say, 110026, AvatarSay);
	eq.register_npc_event("shawleight", Event.signal, 110069, NalotSignal);
	eq.register_npc_event("shawleight", Event.timer, 110069, NalotTimer);
end

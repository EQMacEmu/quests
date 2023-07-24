local RELV_TYPE = 210090; -- Relv_the_Mysterious
local DECREPIT_TYPE = 210486; -- a_decrepit_ent
local VIVACIOUS_TYPE = 210487; -- a_vivacious_ent
local BLAZING_TYPE = 210459; -- a_blazing_mephit (level 62)
local BURNING_TYPE = 210460; -- a_burning_mephit (level 62)
local MEPHEEKA_TYPE = 210462; -- a_fiery_mepheeka
local FALTO_TYPE = 210470; -- Falto,_Lord_of_Thunder
local ADD1_TYPE = 210488; -- a_blazing_mephit (level 60; boss add spawn)
local ADD2_TYPE = 210489; -- a_burning_mephit (level 60; boss add spawn)

local groups = 0;
local eventActive = false;
local wave = 0;
-- Instead of using qglobals, tracking conversation status this way instead
-- Needs to reset on zoning which can't be done with qglobals
-- Sony has some sort of temporary character flag that deletes on zone-out
local sayStateTable = {}; -- key is player name, value is conversation state
local hailStateTable = {};
local entries = 0;

function MoveGroup(zone, client, dist, x, y, z, h)
	local group = client:GetGroup();
	local raid = client:GetRaid();

	if ( group and group:GroupCount() > 0 ) then
		for i = 0, 5 do
			local member = group:GetMember(i):CastToClient();

			if ( member.valid ) then
				if ( member:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < dist ) then
					member:MovePC(zone, x, y, z, h*2);
					if ( member:GetPet().valid and not member:GetPet():Charmed() ) then
						member:GetPet():GMMove(x, y, z, 0);
					end
				end
			end
		end
		
	elseif ( raid and raid.valid ) then
		local raidGroupID = raid:GetGroup(client:GetName());
		local member;
		for i = 0, 71 do
			member = raid:GetMember(i);
			
			if ( member and member.valid and raid:GetGroup(member:GetName()) == raidGroupID ) then
			
				if ( member:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) < dist ) then
					member:MovePC(zone, x, y, z, h*2);
					if ( member:GetPet().valid and not member:GetPet():Charmed() ) then
						member:GetPet():GMMove(x, y, z, 0);
					end
				end
			end
		end		
	else
		client:MovePC(zone, x, y, z, h*2);
		if ( client:GetPet().valid and not client:GetPet():Charmed() ) then
			client:GetPet():GMMove(x, y, z, 0);
		end
	end
end

function IsClientInTrial()
	local clientList = eq.get_entity_list():GetClientList();

	if ( clientList ) then
		for client in clientList.entries do
			if ( client.valid and client:GetY() > 3000 ) then
				if ( not client:GetGM() ) then
					return true;
				end
			end
		end
	end
	return false;
end

function CheckRemoveFromTrial(limit, x, y, z, h)
	local clientList = eq.get_entity_list():GetClientList();
	local n = 0;

	if ( clientList ) then
		for client in clientList.entries do
			if ( client.valid and client:GetY() > 3000 ) then
				if ( not client:GetGM() ) then
					n = n + 1;
					if ( n > limit ) then
						if ( limit == 0 ) then
							client:Message(0, "The powerful green aura that had pushed you through to the other side of the brush dims as you and your party are pulled back to Relv the Mysterious.");
						end
						client:MovePC(210, x, y, z, h);
						if ( client:GetPet().valid and not client:GetPet():Charmed() ) then
							client:GetPet():GMMove(x, y, z, 0);
						end
						if ( limit > 0 ) then
							eq.debug(client:GetName().." removed from trial because client limit of "..limit.." exceeded");
						end
						n = n - 1;
					end
				end
			end
		end
	end
end


function StartEvent()

	eq.unique_spawn(DECREPIT_TYPE, 0, 0, -1017, 6055, -486, 192);
	
	local x, y;
	local z = -437;
	
	for i = 1, 30 do
		x = math.random(-1172, -3);
		y = math.random(4932, 6069);
		eq.spawn2(eq.ChooseRandom(BLAZING_TYPE, BURNING_TYPE), 16, 0, x, y, z, 0);
	end
	eventActive = true;
end

function EndEvent()
	groups = 0;
	eventActive = false;
	eq.debug("Relv event now available");
	eq.depop_all(BLAZING_TYPE);
	eq.depop_all(BURNING_TYPE);
	eq.depop_all(FALTO_TYPE);
	eq.depop_all(MEPHEEKA_TYPE);
	eq.depop_all(VIVACIOUS_TYPE);
	eq.depop_all(DECREPIT_TYPE);
end

function MephitDeathEvent(e)

	local x = e.self:GetX();
	local y = e.self:GetY();
	local z = e.self:GetZ() + 5;
	
	for i = 1, 3 do
		eq.spawn2(MEPHEEKA_TYPE, 0, 0, x + math.random(-15, 15), y + math.random(-15, 15), z, 0);
	end

	local elist = eq.get_entity_list();
	if ( not elist:IsMobSpawnedByNpcTypeID(BLAZING_TYPE) and not elist:IsMobSpawnedByNpcTypeID(BURNING_TYPE) ) then
		eq.unique_spawn(FALTO_TYPE, 0, 0, -574, 5469, -480, 0);
		eq.debug("Falto spawned");
	end
end

function BossTimerEvent(e)
	if ( e.timer == "adds" ) then
		wave = wave + 1;
		local x = e.self:GetX();
		local y = e.self:GetY();
		local z = e.self:GetZ() + 5;
		
		for i = 1, wave do
			eq.spawn2(eq.ChooseRandom(ADD1_TYPE, ADD2_TYPE), 0, 0, x + math.random(-30, 30), y + math.random(-30, 30), z, 0);
		end
	end
end

function BossCombatEvent(e)
	if ( e.joined ) then
		eq.set_timer("adds", 60000);
		wave = 0;
	else
		eq.stop_timer("adds");
	end
end

function BossDeathEvent(e)
	eq.depop_all(DECREPIT_TYPE);
	eq.unique_spawn(VIVACIOUS_TYPE, 0, 0, -1017, 6055, -486, 192);
	eq.debug("Relv event success");
end

function DecrepitSpawnEvent(e)
	eq.set_timer("check", 30000);
	eq.set_timer("appearance", 1000);
	eq.set_timer("event", 10800000);
end

function DecrepitTimerEvent(e)

	if ( e.timer == "check" ) then
		CheckRemoveFromTrial(24, -1795, -2059, -470, 0);
	
	elseif ( e.timer == "appearance" ) then
		eq.stop_timer(e.timer);
		e.self:SetAppearance(3);
	
	elseif ( e.timer == "event" ) then
		CheckRemoveFromTrial(0, 1562, 2088, -450, 0);
		eq.stop_timer("check");
		eq.debug("Relv event timer expired");
		EndEvent();
	end
end

function VivaciousSpawnEvent(e)
	eq.set_timer("check", 20000);
end

function VivaciousTimerEvent(e)
	if ( e.timer == "check" ) then
		if ( not IsClientInTrial() ) then
			EndEvent();
		end
	end
end

function RelvSayEvent(e)
	
	local name = e.other:GetName();
	
	local state = sayStateTable[name] or 0;
	local hails = hailStateTable[name] or 0;

	if ( e.message:findi("hail") ) then
	
		hails = hails + 1;
		
		if ( hails == 1 ) then
			e.self:Say("Greetings to you, small one. I see you have made great progress through our fair planar dwelling. Were it not for the dubious undertakings by someone... or something, I would be more than glad to welcome you here. Unfortunately, there have been dangerous tidings afoot. Just look at the trees around you. This destruction is the work of something altogether unseen, at least by me.");
			state = 1;
			
		elseif ( hails == 2 ) then
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "Relv looks at you with a slight hint of hindrance. 'You are an odd individual, truly. What manner of speaking is it to hail me once more, after I have already begun conversing with you? Hmm, considerably odd. May I continue?'");
			
		elseif ( hails == 3 ) then
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "Relv sighs. 'I suppose that you are not here to help as I had once hoped. Certainly someone that was here to help would have a deeper vocabulary than that of just 'hail'. In any case friend, if you would like to help or hear my plight, please come back. For now I can see that you are far too busy to assist.'");
		
		elseif ( hails == 4 ) then
			e.self:Say("I tire of this endless babble! Please remove yourself from my presence if all you plan on doing is repeating the same thing over and over again! I have no need of this kind of harassment, you foul affront to intelligent folk!");
			
		elseif ( hails >= 5 ) then
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "Relv merely sighs and ignores you.");
		end
	
	elseif ( state == 1 and (e.message:findi("destruction") or e.message:findi("continue")) ) then
	
		if ( hails > 1 ) then
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "Relv raises an eyebrow at you somewhat apprehensively, as though he is not entirely sure of your purpose here. 'So you can do more than simply repeat the same thing over and over. Very well, I will continue. There was a time when all the trees were green and alive, though as you can see, that time is no more. I am unsure what it is that has caused the damage, but I do know that whatever it is has caused a great deal of damage and will continue to do so unless someone like yourself has the courage to rid us of it.' [continue]");
		else
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "Relv the Mysterious says 'There was a time when all the trees were green and alive, though as you can see, that time is no more. I am unsure what it is that has caused the damage, but I do know that whatever it is has caused a great deal of damage and will continue to do so unless someone like yourself has the courage to rid us of it.' [continue]");
		end
		state = 2;
	
	elseif ( state > 1 and e.message:findi("continue") ) then
	
		if ( state == 2 ) then
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "Relv looks about him at the charred trees and sighs. 'If this destruction is not stopped, we may soon not have any forest left, which would cause a great disturbance in the balance of this land. If it were in my power, I would go forth through the brush here to try and stop whatever it is that is causing this. Unfortunately, I cannot leave, as I must protect the rest of the trees here from any beasts that may try to defile these lands further. This is why I must ask for an outsider to help, so that I may send them forth through the brush into the clearing beyond to find the menace and destroy it at the source.' [continue]");
			state = 3;
		
		elseif ( state == 3 ) then
			if ( hails > 1 ) then
				e.self:Say("While you have shown yourself so far to be somewhat odd, and perhaps a bit overbearing, I must say that you are the first hope I have had that anyone might aid me in this problem. I have waited patiently for someone to come along to defeat this scourge on the land, and you may just be the one. If you feel you are courageous enough to go forth, please let me know and I will make preparations to assist you through the brush to end whatever suffering the forest is feeling beyond.");
			else
				e.self:Say("I have waited patiently for someone to come along to defeat this scourge on the land, and you may just be the one. If you feel you are courageous enough to go forth, please let me know and I will make preparations to assist you through the brush to end whatever suffering the forest is feeling beyond.");
			end
			state = 4;
		end
		
	elseif ( state == 4 and e.message:findi("courageous") ) then
		if ( not eventActive and not IsClientInTrial() ) then
			e.self:Say("As I had hoped. I regret that I have only enough strength to send four parties through the brush to the other side, and only one party at a time. When each party is ready to move forth, tell me that you are ready and I will make a clearing for you to go through. Be wary, as my magic will only last for three hours before you are pulled back to me, so do whatever you can before that time is up!");
			StartEvent();
		end
	
	elseif ( e.message:findi("ready") ) then
	
		if ( not eventActive or groups >= 4 ) then
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "The green aura around Relv has passed, and it appears that he no longer has the power to push another group forth past the brush.");
		else
			eq.get_entity_list():MessageClose(e.self, true, 100, 0, "A powerfully green aura surrounds Relv as he opens a small rift in the brushes beyond, then sends you and your party forth into the burning forest beyond. ");
			MoveGroup(210, e.other, 100, -1087, 6040, -483, 103);
			groups = groups + 1;
		end
	end
	
	if ( state > 0 ) then
		if ( not sayStateTable[name] ) then
			if ( entries == 0 ) then
				eq.set_timer("checkreset", 20000);
			end
			entries = entries + 1;
		end
		sayStateTable[name] = state;
		hailStateTable[name] = hails;
	end
end

function RelvTimerEvent(e)
	-- periodocally check if players have left the zone, then clear their quest status if so
	if ( e.timer == "checkreset" ) then
	
		local mob;
		local elist = eq.get_entity_list();
		
		for name, id in pairs(sayStateTable) do
		
			mob = elist:GetClientByName(name);
			
			if ( not mob or not mob.valid ) then
				sayStateTable[name] = nil;
				hailStateTable[name] = nil;
				entries = entries - 1;
				--eq.debug(name.." deleted from Relv conversation memory", 3);
			end
		end
	end
	if ( entries == 0 ) then
		eq.stop_timer(e.timer);
		--eq.debug("memory timer stopped for Relv", 3);
	end
end

function RelvTradeEvent(e)
	local item_lib = require("items");

	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 28784 }) ) then -- Lightning Crystals
		e.self:Say("So it was a maniacal Lord of Thunder who was terrorizing our fair forests? What would move a being such as he to do something so awful? It matters not any more; all that matters is that you have returned and helped restore our forest to the safe and serene place that it was, at least for now. Let us hope that this type of thing does not occur in the future. Thank you again, friend. Please take this as a token of gratitude from the forest, as well as myself.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 7755, 50000); -- Ruby Pendant with a Gold Chain
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function VivaciousSayEvent(e)

	if ( e.message:findi("hail") ) then
		eq.get_entity_list():MessageClose(e.self, true, 100, 0, "The tree is but a weak reflection of a once proud and strong part of nature. With a slow and solemn voice, it speaks to you, 'I thank you for what you have done here today, ridding us of the maniacal ways of the Lord of Thunder. You cannot understand the plight we have been through, nor how much you have truly helped us by this most generous of acts. When you are ready to return to Relv, let me know and I will assist you in getting back through the brush to the other side.'");
		
	elseif ( e.message:findi("ready to return") ) then
		e.self:Emote("chants an ancient entian dialect that you do not understand and sends you back through the underbrush to meet up again with Relv the Mysterious.");
		MoveGroup(210, e.other, 150, 1562, 2088, -450, 28);
	end
end

function AddSpawnEvent(e)
	eq.set_timer("depop", 180000);
end
function AddTimerEvent(e)
	eq.depop();
end
function AddCombatEvent(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	eq.register_npc_event("Relv", Event.death_complete, BLAZING_TYPE, MephitDeathEvent);
	eq.register_npc_event("Relv", Event.death_complete, BURNING_TYPE, MephitDeathEvent);
	
	eq.register_npc_event("Relv", Event.say, RELV_TYPE, RelvSayEvent);
	eq.register_npc_event("Relv", Event.trade, RELV_TYPE, RelvTradeEvent);
	eq.register_npc_event("Relv", Event.timer, RELV_TYPE, RelvTimerEvent);
	
	eq.register_npc_event("Relv", Event.death, FALTO_TYPE, BossDeathEvent);
	eq.register_npc_event("Relv", Event.timer, FALTO_TYPE, BossTimerEvent);
	eq.register_npc_event("Relv", Event.combat, FALTO_TYPE, BossCombatEvent);
	
	eq.register_npc_event("Relv", Event.spawn, ADD1_TYPE, AddSpawnEvent);
	eq.register_npc_event("Relv", Event.spawn, ADD2_TYPE, AddSpawnEvent);
	eq.register_npc_event("Relv", Event.timer, ADD1_TYPE, AddTimerEvent);
	eq.register_npc_event("Relv", Event.timer, ADD2_TYPE, AddTimerEvent);
	eq.register_npc_event("Relv", Event.combat, ADD1_TYPE, AddCombatEvent);
	eq.register_npc_event("Relv", Event.combat, ADD2_TYPE, AddCombatEvent);
	
	eq.register_npc_event("Relv", Event.spawn, DECREPIT_TYPE, DecrepitSpawnEvent);
	eq.register_npc_event("Relv", Event.timer, DECREPIT_TYPE, DecrepitTimerEvent);
	
	eq.register_npc_event("Relv", Event.timer, VIVACIOUS_TYPE, VivaciousTimerEvent);
	eq.register_npc_event("Relv", Event.spawn, VIVACIOUS_TYPE, VivaciousSpawnEvent);
	eq.register_npc_event("Relv", Event.say, VIVACIOUS_TYPE, VivaciousSayEvent);
end

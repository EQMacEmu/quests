function CorporalSpawn(e)
	eq.set_timer("onset",60000);
end

function BerzDolSpawn(e)
	eq.set_timer("onset",55000);
end

function BerzVolSpawn(e)
	eq.set_timer("onset",58000);
end

function CorporalTimer(e)
	if(e.timer == "onset")then
		e.self:CastToNPC():MoveTo(-4341,-748,-183,-1,true);
		eq.stop_timer("onset");
		eq.set_timer("readygo",90000);
	elseif(e.timer == "readygo" and e.self:GetX() ==-4341 and e.self:GetY() ==-748) then
		e.self:Say("Onward men, the eyes of Zek are upon us.");
		eq.stop_timer("readygo");
		e.self:CastToNPC():AssignWaypoints(23);
		eq.get_entity_list():GetMobByNpcTypeID(119025):CastToNPC():AssignWaypoints(25);
		eq.get_entity_list():GetMobByNpcTypeID(119027):CastToNPC():AssignWaypoints(24);
		eq.get_entity_list():GetMobByNpcTypeID(119028):CastToNPC():AssignWaypoints(22);
	end
end

function BerzDolTimer(e)
	e.self:CastToNPC():MoveTo(-4310,-741,-183,-1,true);
	eq.stop_timer("onset");
end

function BerzVolTimer(e)
	e.self:CastToNPC():MoveTo(-4311,-720,-183,-1,true);
	eq.stop_timer("onset");
end

function CorporalWayPoint(e)
	if(e.wp == 5) then
		e.self:Say("Hold here squad");
	end
end

function CorporalSay(e)
	if(e.message:findi("troop attack") and e.self:GetX() ==-225 and e.self:GetY() ==1725) then
		eq.depop_with_timer(119050);
		eq.unique_spawn(119030,0,0,-4457,-1288,-115,9); -- NPC: #Lieutenant_Krofer
		e.self:Shout("Destroy them!!");
		eq.get_entity_list():GetMobByNpcTypeID(119045):Emote(", all around the Sifaye village, several beings phase into reality.  Their eyes glow with the golden light of divinity, obviously sent from a higher plane of existence.  The Kromzek assault squad is surely doomed. You decided to withdraw and report what you have found, perhaps the Lieutenant will understand.");
		eq.get_entity_list():GetMobByNpcTypeID(119027):Say("Woah! we're being ambushed!!");
		eq.spawn2(119029,0,0,-146,1703,-192,187):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(eq.ChooseRandom(119022,119025,119027,119028)),1); -- a_sifaye_defender
		eq.spawn2(119029,0,0,-149,1731,-192,187):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(eq.ChooseRandom(119022,119025,119027,119028)),1); -- a_sifaye_defender
		eq.spawn2(119029,0,0,-162,1738,-192,187):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(eq.ChooseRandom(119022,119025,119027,119028)),1); -- a_sifaye_defender
		eq.spawn2(119029,0,0,-172,1758,-192,182):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(eq.ChooseRandom(119022,119025,119027,119028)),1); -- a_sifaye_defender
	end
end

function DefenderSpawn(e)
	eq.set_timer("depop",300000);
end

function DefenderTimer(e)
	eq.depop();
end

function event_encounter_load(e)
	eq.register_npc_event("reinforcement", Event.spawn, 119022, CorporalSpawn);
	eq.register_npc_event("reinforcement", Event.spawn, 119025, BerzDolSpawn);
	eq.register_npc_event("reinforcement", Event.spawn, 119027, BerzVolSpawn);
	eq.register_npc_event("reinforcement", Event.timer, 119022, CorporalTimer);
	eq.register_npc_event("reinforcement", Event.timer, 119025, BerzDolTimer);
	eq.register_npc_event("reinforcement", Event.timer, 119027, BerzVolTimer);
	eq.register_npc_event("reinforcement", Event.waypoint_arrive, 119022, CorporalWayPoint);
	eq.register_npc_event("reinforcement", Event.say, 119022, CorporalSay);
	eq.register_npc_event("reinforcement", Event.spawn, 119029, DefenderSpawn);
	eq.register_npc_event("reinforcement", Event.timer, 119029, DefenderTimer);
end

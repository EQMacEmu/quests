-- Coldain Ring: Quest 4
local hailtimer = 0;

function TainSpawn(e)
	eq.set_timer("passout",30000);
	hailtimer = 0;
end

function GhrekSpawn(e)
	eq.set_timer("attack",1000);
end

function FrostSpawn(e)
	eq.set_timer("attack",2000);
end

function GhrekCombat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",30000);
		e.self:SaveGuardSpot();
	end
end

function FrostCombat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",30000);
		e.self:SaveGuardSpot();
	end
end

function FrostTimer(e)
	if(e.timer == "depop") then
		eq.depop();
		eq.stop_timer("depop");
	elseif(e.timer == "attack") then
		eq.attack_npc_type(116005);
		eq.stop_timer("attack");
	end
end

function GhrekTimer(e)
	if(e.timer == "depop") then
		eq.depop();
		eq.stop_timer("depop");
	elseif(e.timer == "attack") then
		eq.attack_npc_type(116005);
		eq.stop_timer("attack");
	end
end

function TainSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("The bloody Kromrif ambushed me! I escaped, but I am near death. They'll be tracking me down to finish me off at any moment. Without [help], I'm as good as dead.");
		e.self:SetAppearance(0);
	elseif(e.message:findi("help") and hailtimer == 0) then
		eq.unique_spawn(116018, 0, 0, -3260, -4819, 190, 65); -- NPC: Ghrek_Squatnot
		eq.spawn2(116019, 0, 0, -3260, -4793, 190, 65); -- NPC: #a_frost_giant
		eq.spawn2(116019, 0, 0, -3260, -4859, 190, 65); -- NPC: #a_frost_giant
		eq.spawn2(116019, 0, 0, -3260, -4881, 190, 65); -- NPC: #a_frost_giant
		e.self:SetAppearance(3);
		hailtimer = 1;
		eq.set_timer("hailing",600000);
	end
end

function TainTimer(e)
	if(e.timer == "passout") then
		e.self:SetAppearance(3);
	elseif(e.timer == "hailing") then
		hailtimer = 0;
	end
end

function TainCombat(e)
	if(e.joined) then
		eq.stop_timer("passout");
	else
		eq.set_timer("passout",30000);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("ringfour", Event.say, 116005, TainSay);
	eq.register_npc_event("ringfour", Event.timer, 116005, TainTimer);
	eq.register_npc_event("ringfour", Event.spawn, 116005, TainSpawn);
	eq.register_npc_event("ringfour", Event.combat, 116005, TainCombat);
	eq.register_npc_event("ringfour", Event.spawn, 116018, GhrekSpawn);
	eq.register_npc_event("ringfour", Event.spawn, 116019, FrostSpawn);
	eq.register_npc_event("ringfour", Event.combat, 116019, FrostCombat);
	eq.register_npc_event("ringfour", Event.combat, 116018, GhrekCombat);
	eq.register_npc_event("ringfour", Event.timer, 116018, GhrekTimer);
	eq.register_npc_event("ringfour", Event.timer, 116019, FrostTimer);
end
function VindiCombat(e)
	if(e.joined)then
		eq.signal(113120,1); -- NPC: a_temple_guardian
		eq.signal(113352,1); -- NPC: a_temple_guardian
	end
end

function Temple1Signal(e)
	if(e.signal == 1) then
		eq.follow(eq.get_entity_list():GetMobByNpcTypeID(113118):GetID());
	end
end

function Temple2Signal(e)
	if(e.signal == 1) then
		eq.follow(eq.get_entity_list():GetMobByNpcTypeID(113118):GetID(),5);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("vindicator", Event.combat, 113118, VindiCombat);
	eq.register_npc_event("vindicator", Event.signal, 113120, Temple1Signal);
	eq.register_npc_event("vindicator", Event.signal, 113352, Temple2Signal);
end

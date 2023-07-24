-- depop timers for Jiva add spawns.  We really, really need a database field for this instead of scripting this 1000 times

local TYPES = { 212399, 212400, 212401, 212402, 212403, 212404, 212405, 212406 };

function EventSpawn(e)
	eq.set_timer("depop", 600000);
end

function EventTimer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function EventCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)

	for _, id in ipairs(TYPES) do
		eq.register_npc_event("JivaAdds", Event.combat, id, EventCombat);
		eq.register_npc_event("JivaAdds", Event.timer, id, EventTimer);
		eq.register_npc_event("JivaAdds", Event.spawn, id, EventSpawn);
	end

end

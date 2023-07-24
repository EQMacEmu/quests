function event_spawn(e)
	eq.set_next_hp_event(50);
end

function event_hp(e)
	e.self:ModifyNPCStat("special_abilities", "4,1,20"); -- wild/aoe rampage 20%
end

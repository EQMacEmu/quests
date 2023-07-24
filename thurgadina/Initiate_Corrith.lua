-- Initiate Corrith fighting

function event_spawn(e)
	eq.set_timer("fight",math.random(30000) + 10000);
end

function event_timer(e)
	e.self:DoAnim(2);
	e.self:DoAnim(7);
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(115176)) then
		eq.get_entity_list():GetMobByNpcTypeID(115176):CastToNPC():DoAnim(2);
	end
end

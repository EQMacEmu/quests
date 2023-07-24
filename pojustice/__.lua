function event_combat(e)
	e.self:Emote("The shrill croon of banshees fills the room...");
	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(201287) ) then
		eq.spawn2(201287, 0, 0, 223, -494, -26, 0); -- wraith_of_retribution
	end
	eq.depop_with_timer();
end

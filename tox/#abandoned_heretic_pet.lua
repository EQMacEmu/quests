function event_waypoint_arrive(e)
	if(e.wp == 5) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(38009) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(38010)) then
			e.self:Say("Speed up the digging my pets!");
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(38009)) then
				eq.get_entity_list():GetMobByNpcTypeID(38009):Say("We are not your pets!");
			end
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(38010)) then
				eq.get_entity_list():GetMobByNpcTypeID(38010):Say("We will speed up when you return our mining caps. There are falling rocks all over this place! We could get killed!");
			end
		end
	elseif(e.wp == 7) then
		e.self:Say("Blast you, skeletons!  Why I ever resurrected you, I don't know!");
	end
end

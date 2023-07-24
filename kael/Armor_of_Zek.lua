function event_signal(e)

	if (e.signal == 1) then
	
		local statue = eq.get_entity_list():GetMobByNpcTypeID(113000);
		
		eq.follow(statue:GetID());
	end
end

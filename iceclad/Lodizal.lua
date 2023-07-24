function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Emote("sniffs and turns slowly, its huge head swinging from side to side as it looks for food.");
	elseif(e.wp == 4) then
		e.self:Emote("roars at the village angrily, its trail of destruction stretching behind.");
	elseif(e.wp == 6) then
		e.self:Emote("bellows one last time, its fiery maw satiated by its angry feeding. It heads towards the ocean, its gut full and its anger quenched.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110050)) then
			eq.get_entity_list():GetMobByNpcTypeID(110050):Emote("sniffs at the air, its teeth still bared in distrust.  With a growl, it relaxes as it realizes the horrible sea monster has left the village in peace.");
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110008)) then
			eq.get_entity_list():GetMobByNpcTypeID(110008):Emote("sniffs at the air, its teeth still bared in distrust.  With a growl, it relaxes as it realizes the horrible sea monster has left the village in peace.");
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110010)) then
			eq.get_entity_list():GetMobByNpcTypeID(110010):Emote("sniffs at the air, its teeth still bared in distrust.  With a growl, it relaxes as it realizes the horrible sea monster has left the village in peace.");
		end
	elseif(e.wp == 7) then
		e.self:Emote("bellows and thrashes around. His flippers kick hard snow and ice into the air. His maw snaps and opens like a promise of death.");
	end
end

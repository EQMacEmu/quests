function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there " .. e.other:GetCleanName() .. ", how are ya enj...");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(150023)) then
			eq.get_entity_list():GetMobByNpcTypeID(150023):Say("Hey Albarok, I dont recall allowing you to have visitors!");
		end
	end
end

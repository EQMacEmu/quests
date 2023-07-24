function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo dere " .. e.other:GetCleanName() .. ". It's nice to see you have made it to our armor shop. We got all the finest selections that could suit your taste.  If ye got any questions I'm Toddor and dis is me wife Melina.");
		e.self:DoAnim(66); -- raise hand
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(150271)) then
			eq.get_entity_list():GetMobByNpcTypeID(150271):Say("Hello there!");
		end
	end
end

function event_spawn(e)
	eq.set_timer("rub",3000000);
end

function event_timer(e)
	e.self:Emote(eq.ChooseRandom("rubs her arms to warm herself up. 'Did you find me something other than biscuits yet? What? No? Stay on your side of the igloo, then, Sojan!","shivers violently.  'I hate this place.  My sister always told me I shouldn't be a pirate and that you were nothing but a clockwork grease pouring imbecile!'"));
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110066)) then
		eq.get_entity_list():GetMobByNpcTypeID(110066):Emote("sighs and stares at the ground solemnly"); -- Make Sojan the Sleepless response.
	end
end

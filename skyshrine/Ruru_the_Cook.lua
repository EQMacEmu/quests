function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A stranger? Hmm. Well since you are new to these parts, I will introduce myself. I am Ruru, I do the cooking around here. Best cook in all the lands I would say.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114467)) then
			eq.get_entity_list():GetMobByNpcTypeID(114467):Emote("laughs, 'I'm sure they'd prefer my Boysenberry pie to your Roasted Walrus with Plum Sauce any day.'");
			e.self:Emote("laughs, 'Don't get me started. You know that my cuisine Is prefered over yours two to one.'");
		elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114639)) then
			eq.get_entity_list():GetMobByNpcTypeID(114639):Emote("laughs, 'I'm sure they'd prefer my Boysenberry pie to your Roasted Walrus with Plum Sauce any day.'");
			e.self:Emote("laughs, 'Don't get me started. You know that my cuisine Is prefered over yours two to one.'");
		end
	end
end

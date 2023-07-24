function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there stranger, pleased to meet you. I'm Ruru, I do the cooking around here. I'm the best cook around these parts. So, if you get hungry, you'd best be making sure you're coming to see me.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114467)) then
			eq.get_entity_list():GetMobByNpcTypeID(114467):Emote("laughs, 'I'm sure they'd prefer my Boysenberry pie to your Roasted Walrus with Plum Sauce any day.'");
			e.self:Emote("laughs, 'Don't get me started. You know that my cuisine Is prefered over yours two to one.'");
		end
	end
end

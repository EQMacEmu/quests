function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You know I think they set us goals they know we can't meet just so we'd work harder.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(153070)) then
			eq.get_entity_list():GetMobByNpcTypeID(153070):Say("What's that Perrin?  Need more work do ye?");
		end
	end
end

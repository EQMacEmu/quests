function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Squawk! Pieces of eight! Pieces of eight!");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110053)) then
			eq.get_entity_list():GetMobByNpcTypeID(110053):Say("The cap'n said PIRATES! Not parrots ye knucklehead!' He whacks the other raider upside the head. 'now whars the tinkered rope!?'");
			e.self:Say("We be out.  Youll be needin to make more. Arg!");
		end
	end
end
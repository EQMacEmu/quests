function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("H-hi.  I'm Tsilos.  I'm a swabbie.  That means I get to swab the decks.  We don't have decks any more so they only let me run paths in the snow.  I get to make lots of lines here and there so the other guys have nice places to walk on.  It's not a bad job, except for the yelling.");
	elseif(e.message:findi("yelling")) then
		e.self:Say("All the shouting and ordering.  It makes me nervous.  I get a little scared when everyone is yelling.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110069)) then
			eq.get_entity_list():GetMobByNpcTypeID(110069):Say("WHAT?!  Codsarnit boy!  This be a pirate camp.  Ye best batten down those matches and learn ta be tough or ya ain't ever gonna make it!");
		end
	end
end

function event_signal(e)
	e.self:Emote("shivers.  'Y-yes Cap'n.  I'm tough.  I'm a t-tough pirate..");
end
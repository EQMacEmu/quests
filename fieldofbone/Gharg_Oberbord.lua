function event_spawn(e)
	eq.set_timer("laugh",3100000);
end

function event_timer(e)
	e.self:Emote("laughs heartily at one of the skeletons.");
end
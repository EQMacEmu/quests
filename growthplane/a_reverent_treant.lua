function event_spawn(e)
	eq.set_timer("hum",30000);
end

function event_timer(e)
	e.self:Emote(eq.ChooseRandom("rumbles.  Its voice sounds like bark cracking and moving in a strange hum of song.  It seems to be humming to the large tree.","whispers, like wind through the tree tops, as it speaks hushed words to the tree."));
end
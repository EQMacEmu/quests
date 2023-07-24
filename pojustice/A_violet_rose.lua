function event_combat(e)
	e.self:Emote("lies in the middle of the floor.  It seems to call to you in a faint whisper.  As you get closer, it suddenly explodes in a cloud of thick black smoke.");
	eq.spawn2(201517, 0, 0, 116, -308, -0.259, 33); -- Wraith_of_Domagr
	eq.spawn2(201517, 0, 0, 107, -274, -0.259, 81);
	eq.spawn2(201517, 0, 0, 158, -274, -0.259, 164);
	eq.spawn2(201517, 0, 0, 164, -306, -0.259, 213);
	eq.depop_with_timer();
end

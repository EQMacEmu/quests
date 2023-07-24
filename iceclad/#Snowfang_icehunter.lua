function event_spawn(e)
	eq.set_timer("fish",600000);
end

function event_timer(e)
	if(e.timer == "fish") then
		walrus = eq.ChooseRandom("slaps its feet against the hard ice, making walrus-like sounds.","dips its club into the water and splashes it around just a little, imitating fish sounds.");
		e.self:Emote(walrus);
	end
end
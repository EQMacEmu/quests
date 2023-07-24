function event_say(e)
	if(e.message:findi("hail")) then
		gorlib = math.random(100);
		if(gorlib < 48) then
			e.self:Emote("appears enthralled as he tears page after page out of a book titled ''Secrets of the Universe, Volume 8.''");
		elseif(gorlib < 98) then
			e.self:Emote("looks at you out of the corner of his eye as he chews in contentment upon an ancient scroll lined with silver and covered with mystical runes of power.");
		else
			e.self:Emote("throws the book he was chewing on to the ground and attacks.");
			eq.attack(e.other:GetName());
		end
	end
end

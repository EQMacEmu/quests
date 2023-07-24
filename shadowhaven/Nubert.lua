function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh? Ah, who's there? Don't you know it's impolite to break into someone's house while they are sleeping? If it's that important then come back later, will ya?");
	end
end

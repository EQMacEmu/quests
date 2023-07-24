function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! I'd love to stop and chat with ya but I'm running late to an appointment in Freeport with a fletcher interested in my superior wooden shafts.");
	end
end

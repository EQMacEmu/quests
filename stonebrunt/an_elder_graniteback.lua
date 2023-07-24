function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you menacingly, smacks its chest, then turns away.");
	end
end
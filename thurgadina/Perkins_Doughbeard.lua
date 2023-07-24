function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("As far as I'm concerned there are only two arts in this world: alcohol and food. The Velium Keg is probably the best place to go for the former but I've got all yer needs for the latter covered right here.");
	end
end

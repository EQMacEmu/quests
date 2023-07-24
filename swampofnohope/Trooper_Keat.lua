function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("takes a stone from his pocket and skips it across the ground.  It goes quite far.  'Did you see that?  Skipping stone champion three seasons in a row!  Good thing I found these great stones on the corpses of dead frogloks.");
	end
end
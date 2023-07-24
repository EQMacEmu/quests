function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Argh.  I can't take being posted here in these blasted caverns anymore.  Even these card games are getting boring.");
	end
end

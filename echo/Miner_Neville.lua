function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Whew, just catchin' me breath.  I'll be back to diggin' in just a sec.  No need to tell the boss about this.");
	end
end

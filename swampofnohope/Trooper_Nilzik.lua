function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs the air around you.  'I thought I smelled something horrible.");
	end
end
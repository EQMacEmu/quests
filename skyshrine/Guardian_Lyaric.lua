function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote('grumbles and sighs "They always have me watch the dead end hallway.  Nothing exciting ever happens here.');
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("watches you but does not say a word.");
	end
end

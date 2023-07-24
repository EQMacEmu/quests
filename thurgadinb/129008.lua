function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("starts to speak with you and then breaks down sobbing. Coldain Outcast says, 'I'm sorry, but I still can't bring myself to talk about it. It's too horrible, what I did. Please, either just buy something or leave me to my sorrows.");
	end
end

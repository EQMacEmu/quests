function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A pleasure to make your acquaintance. I was not aware that Nathyn was expecting more guests. I suppose some company will do him good, his mood hasn't been all that great lately.");
	end
end

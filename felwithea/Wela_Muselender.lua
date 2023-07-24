function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("curtseys and says, 'Welcome to our fine tavern! Our relaxing atmosphere and pleasant wines are excellent for assisting an artist or poet in finding their muse.");
		e.self:DoAnim(61);
	end
end
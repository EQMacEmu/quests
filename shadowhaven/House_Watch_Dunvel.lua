function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the House of Fordel. Please be respectful of those you meet inside, for they are the descendants of Shadowhaven's founders.");
	end
end

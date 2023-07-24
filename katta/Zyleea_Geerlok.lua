function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there! If you don't find what you are looking for in my selection of wares perhaps my husband Blaylok will be able to provide it for you.");
	end
end

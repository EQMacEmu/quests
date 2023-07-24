function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, I sell only first-rate traveling packs- they are made from the finest leathers and skins available. If you're looking for something a bit more heavy duty, Bestive can help you out.");
	end
end

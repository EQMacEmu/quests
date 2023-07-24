function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There is rumor that a young N`Ogard is lost in the maze. Perhaps you should go find the father and see if you can help.");
	end
end

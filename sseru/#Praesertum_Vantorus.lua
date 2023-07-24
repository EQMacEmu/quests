function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("You are a brave one, are you not?  Few dare to disturb a Praesertum in his chambers, and fewer still dare to disturb me.  Ha!  I like that.  What is it you seek?  I promise nothing, but you earned some small portion of my time to listen to you.  I also warn you, any treachery will meet a swift and final end.  Of this have no doubt.");
	elseif ( e.message:findi("loot") ) then
		e.self:Say("Have you visited the Plane of Growth lately?");
	end
end

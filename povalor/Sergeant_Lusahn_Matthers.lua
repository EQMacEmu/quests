function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Greetings, "..e.other:GetName()..".  I have a little time to chat, we are not due in the [field] for a while.  What may I help you with?");
	elseif ( e.message:findi("field") ) then
		e.self:Say("The Glassy Wastelands.  We work hard to keep the [plight] back from the rest of the Forest, but I fear that is a losing battle.");
	elseif ( e.message:findi("plight") ) then
		e.self:Say("I am afraid that I am not at liberty to go into depth, even with the little that we know.  What I can tell you is that the Wasteland is dangerous; the glass manages to hide terrors that few men outside these walls could bear to speak of, much less see.  If you choose to journey know that we will offer you little protection.");
	end
end

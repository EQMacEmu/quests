function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Emote("shares a stare of blankness as you grab her attention, 'Where are your shackles?  How can you move about freely here?  Were you sent to check on the new schematics that I have drawn up?  They are nearly finished, do you need them now?'");
		
	elseif ( e.message:findi("need them") ) then
		e.self:Say("Fine.  Have them.  When you take these to the Zeks perhaps you could mention how hard I worked on them, and my release could be considered.  I know that my desire to serve Rallos was once great, but I would like for my soul to finally be at rest.");
		e.other:SummonCursorItem(18636); -- Advanced Glazeworking
	end
end

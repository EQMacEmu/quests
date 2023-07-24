function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Emote("looks around skittishly. 'What are you doing here? [SPY]! SPY!'");
		eq.signal(208014, 2); -- Sergeant_Gerrin_Bakeside
		
	elseif ( e.message:findi("spy") ) then
		e.self:Say("They are here.  I can see them, no one else can, don't tell the sergeant, I know he won't believe me.  None of them believe me, but they are everywhere.  I can hear them whispering.  Shhh can you [hear them]?");
		
	elseif ( e.message:findi("hear them") ) then
		e.self:Say("Oh, can you? That is very good, you are wise.  Very wise indeed.  Keep your eyes out and your ears open.  The shadow is close. For the honor of Ducee Lealson.");
	end
end

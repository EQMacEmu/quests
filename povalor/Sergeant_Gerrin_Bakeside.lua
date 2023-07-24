function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("Greetings, Soldier.  I'm sorry, if you've come for weapons, what you see here is only for use by the army of Marr. Right now we are not accepting new recruits into [Ducee Lealson.]");
		
	elseif ( e.message:findi("Ducee Lealson") ) then
		e.self:Say("We are Ducee Lealson, Ducee Lealson is Loyalty!  Fyking, Fellon, Rydric, and myself are renowned through these areas for our skill in battle.  Each man in Ducee Lealson is not only willing to die for his compatriots, but he considers it an [honor.]");
		
	elseif ( e.message:findi("honor") ) then
		e.self:Say("Yes, we go where the Hand of Honor points us.  Live or die, to serve is an honor.  We do not fear our own demise, everyone dies, the men of Ducee Lealson die with honor.");
	end
end

function event_signal(e)

	if ( e.signal == 1 ) then
		e.self:Say("Enough soldier! You will serve as it is seen fit to have you serve, the honor of Ducee Lealson does not fade once we leave the battlefield. Your father knew that, you would do well to take after him more.");
		eq.signal(208069, 1); -- Fyking_Baer
		
	elseif ( e.signal == 2 ) then
		e.self:Say("Fellon! There are no spies, keep your head man!");
	end
end

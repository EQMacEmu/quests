function event_signal(e)
	e.self:Say("You mean your stench will soon march upon the land!");
	eq.signal(68209,1); -- NPC: Guard_Kyte
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend! Welcome to Fort Gonin. Home to me and my slow-witted brother, Kyte.");
	elseif(e.message:findi("kyte")) then
		e.self:Say("Oh, Kyte? She is my baby sister. Looks a bit like a chap, wouldn't you say?");
	end
end

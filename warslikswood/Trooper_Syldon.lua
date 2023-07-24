function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Be very careful if you plan on traveling the roads of Warsliks Woods. The goblins and Kromdul have been assaulting travelers.");
	end
end
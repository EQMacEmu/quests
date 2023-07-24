function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, have you come to visit the [Ruins of Kaesora]?");
	elseif(e.message:findi("kaesora")) then
		e.self:Say("The ancient libraries and temples of Kaesora can be found among these ruins as well as the lost city itself. Among these ruins the magic of the Iksar Empire still holds the power to bind lost souls, something that may prove useful to an adventurer such as yourself.");		
	end
end
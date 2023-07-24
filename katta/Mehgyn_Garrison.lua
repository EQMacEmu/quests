function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! I am Mehgyn Garrison the Governess of Entertainment here in Katta Castellum. Entertainment is essential for healthy morale and happy citizens. I organize the festivals of the combine holidays and teach music and instrument theory and technique to those wishing to learn the ways of a minstrel.");
	end
end

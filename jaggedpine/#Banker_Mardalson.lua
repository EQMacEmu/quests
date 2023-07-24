function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I used to work for the Qeynos Hold as a book keeper but I got transferred here. I guess it is kind of a promotion. Definitely different way out here and I've gotten a [mixed reception] from some of the locals.");
	elseif(e.message:findi("mixed reception")) then
		e.self:Say("Well apparently there is some kind of minor feud going on between the locals. Some are upset about a recent change of name for this settlement from The Throne of Karana's Fury to Fort Jaggedpine. Seems some are embracing the change and others are old stick in the muds. I'll just do my job and stay out of it though.");
	end
end
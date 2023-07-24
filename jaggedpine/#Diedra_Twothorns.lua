function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Another newcomer, just what we need. I don't mind if you're here to help protect us against the gnoll threat but stay away from my daughter. I don't want her head to be filled up with any other crazy ideas. She has already taken to sneaking away to the city of Qeynos and doing Karana-knows-what with those heathens over there. So just do what you need to do and stay away from her!");
	elseif(e.message:findi("fort")) then
		e.self:Say("It's just awful that name. It's all that Jeremy Leafrunner's fault. Well, his mother's fault anyway. It was she who lead the charge to have the name changed. Karana forgive us for forgetting our history and his gift to us! All this trouble with the gnolls is our punishment for that sleight against him. I'm sure of it!");
	elseif(e.message:findi("throne")) then
		e.self:Say("Would that our settlement was still named The Throne of Karana's Fury. Perhaps we would not be facing his wrath right now. Surely he allowed the gnolls to move in to the north to chastise us for our insolence at forgetting his gift to us.");
	end
end
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well hello there! So many new people coming through here lately, it's so exciting!");
	elseif(e.message:findi("fort") or e.message:findi("throne")) then
		e.self:Say("I don't care one way or the other really. I'm actually thinking of getting out of here for a while to see the world a little bit. It would probably be safer than sticking around here anyway, with the gnoll threat and everything. My mom is superstitious and thinks the gnoll problem is Karana's punishment for changing the name of this place. I don't buy it though.");
	end
end
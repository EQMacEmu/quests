function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("That's right.  Large, cause that's what I be.  If'n ya don't like it, or even if ya do, ya best get to the dock on the other side o' this island.  Ya never know when Icebreaker is gonna stop by again and yer not wantin' ta miss it.");
	end
end

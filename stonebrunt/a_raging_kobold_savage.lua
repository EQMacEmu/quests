function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grrrrr... These are the hunting grounds of Clan Kolbok. Your kind is not welcome here unless you plan on being our next meal!");
	end
end
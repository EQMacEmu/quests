function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Uuuhh, this be a private room, me friend. Mayhap ye should leave before somethin' unfortunate happens.");
	elseif(e.message:findi("unfortunate")) then
		e.self:Say("Oh, I don't know. A guard could suddenly run into the room holdin' his axe straight up in the air like we're taught not to. Ye could be right in his way. Oh, the thought of it just makes me lau... err sick...Maybe ye should leave, eh?");
	end
end

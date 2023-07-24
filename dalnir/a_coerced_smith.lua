function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up at you. You can tell his spirit is broken. His scars speak of a severe beating.");
	elseif(e.message:findi("hammer")) then
		e.self:Emote("blinks a few times. 'The hammer my friend did have. He became sick and they took him away. Where he is I do not know.' ");
	elseif(e.message:findi("forge")) then
		e.self:Emote("stares at you blankly and beings to mumble. 'I work this for for Master Kly. To use this forge, you must have the hammer of Dalnir.'");
	end
end
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Whadda you want? Can't you see I'm trying to keep warm and drink my mug of Valtron's Pale Ale? Leave me be.");
	end
end

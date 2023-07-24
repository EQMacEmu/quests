function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ho there.  Whatcha want?  Yer interruptin' Arboast's story- he was just in the middle of laying some truth on me.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello.  Please feel free to browse.  We make the finest boots in all of Antonica.");
	elseif(e.message:findi("treant wood")) then
		e.self:Say("Looking for Treant material? I do not work with such material. Ask Rodgar. I believe he is upstairs.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("No. I haven't the coins to spare. Perhaps you should ask Rodgar. He works here.");						
	end
end

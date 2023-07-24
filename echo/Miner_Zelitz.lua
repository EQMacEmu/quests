function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, good, I needed a break.  Here take this and dig for a while.  No, well then what are ye wastin' my time fer?");
	end
end

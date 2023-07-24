function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome ta me bar. I suggest ye sit down and have a drink cause if'n ye ai'nt drinkin ye've no business bein 'ere.");
	elseif(e.message:findi("mug")) then
		e.self:Say("Mug, yeah we got a lot of mugs here but what has that got to do with anything.");
	end
end

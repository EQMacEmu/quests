function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What's your poison friend? Why don't you try some Kerreopi. it's lots of fun!");
	end
end

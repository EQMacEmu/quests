function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I really enjoy the evenings in the Steamfont Mountains.  The air is so fresh!");
	end
end

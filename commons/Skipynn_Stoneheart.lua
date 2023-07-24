function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello to you! I hope you do not plan on fishing here. I have claimed this spot. Try the other side of the lake.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Where's your pick?  How you gonna dig without a pick?");
	end
end

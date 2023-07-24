function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing here? Get outta my tent! It's my tent!");
	end
end

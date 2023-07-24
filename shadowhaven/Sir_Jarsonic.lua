function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I don't think I should drink anymore.");
	end
end

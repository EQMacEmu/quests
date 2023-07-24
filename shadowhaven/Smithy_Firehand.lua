function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What we have here is a fine selection of clay and ore. This should be enough to get you started on anything basic, more advanced stuff will have to found on your own.");
	end
end

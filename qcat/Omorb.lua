function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Get out of here!  You are lucky Omorb didn't crush you by mistake!");
	end
end
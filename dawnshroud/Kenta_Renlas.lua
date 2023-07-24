function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Careful of those dawnhoppers. I heard they spit a venom that can cause blindness.");
	end
end

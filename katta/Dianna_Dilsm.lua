function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend. I assist Arabella with her ceramics shop by drawing accurate and detailed pottery sketches. Feel free to browse through my stacks of sketches. you may find one suitable for your pottery endeavors.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you there, " .. e.other:GetCleanName() .. ". Don't mind me. I'm just trying to figure out where on this wall I'm going to set up the dart board. If you're ever in the area again in the future check back and we'll play a game.");
	end
end

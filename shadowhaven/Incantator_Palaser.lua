function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met my friend, I am Palaser. Please let me know if I can be of any assistance.");
	end
end

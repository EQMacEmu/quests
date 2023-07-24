function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met, my friend. If yer a magician I have some spells for ye.");
	end
end

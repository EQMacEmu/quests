function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met friend. I am sorry but I musn't converse while I am on duty.");
	end
end

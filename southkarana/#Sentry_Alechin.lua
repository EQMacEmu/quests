function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, heed my warning.  Begone before nightfall.  There are evil beasts that lurk this land. Begone!");
	elseif(e.message:findi("joanna")) then
		e.self:Say("I miss my people and my temple, but it is too late for me. During the day I serve Erollisi, but at night... <sob> Go! For your own good!");
	end
end


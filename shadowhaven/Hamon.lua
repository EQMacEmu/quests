function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you there, " .. e.other:GetCleanName() .. ". I've had a lil' too much to drink, so I would stay clear of the balcony if I was you. Ugh.");
	end
end

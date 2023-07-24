function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There doesn't seem to be much call for a sketch artist in Thurgadin these days. what with all the sculptures and such. but I get by. Care to purchase one of my sketches. " .. e.other:Race() .. "?");
	end
end

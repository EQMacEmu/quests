function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A warm welcome friend! If you are a practitioner of the alchemical arts you may interested in the wide selection of rare and imported herbs that my family and I have to offer.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What brings to our outpost " .. e.other:GetCleanName() .. "? Did you run into [Anario] by any chance?");
	elseif(e.message:findi("anario")) then
		e.self:Say("Anario was supposed to make a delivery some time ago, but he hasn't shown up yet.");
	end
end

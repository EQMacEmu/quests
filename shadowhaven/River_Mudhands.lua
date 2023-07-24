function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". Welcome to the Tent O` Plenty! If you should need some pottery sketches for the wheel over there then look no further!");
		else
			e.self:Say("You seem like a nice enough stranger but I am afraid all newcomers must see the Patriarch first before we are able to offer our great deals to them.");
		end
	end
end

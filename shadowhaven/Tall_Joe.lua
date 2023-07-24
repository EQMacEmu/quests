function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Lo there traveler. Tall Joe's muh name, making the finest eats in the lands is muh game! Step right up, but only if ya got a hearty appetite.");
		else
			e.self:Say("You seem like a nice enough stranger but I am afraid all newcomers must see the Patriarch first before we are able to offer our great deals to them.");
		end
	end
end

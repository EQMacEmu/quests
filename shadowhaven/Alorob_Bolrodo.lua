function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hello there, " .. e.other:GetCleanName() .. "! I sell all of the finest vegetables that are grown here in the Haven.");
		else
			e.self:Say("You seem like a nice enough stranger but I am afraid all newcomers must see the Patriarch first before we are able to offer our great deals to them.");
		end
	end
end

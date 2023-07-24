function event_death_complete(e)
	eq.spawn2(80040, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
end

function event_say(e)
	if(e.message:findi("who.* ro")) then
		e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
	end
end
function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I long for the day when we might assault the temple of the Dragons.  We shall cover the land in a warm blanket of blood.");
	end
end
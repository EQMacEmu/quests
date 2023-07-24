function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares down at you and tightens his sword grip.");
	end
end
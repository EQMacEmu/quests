function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("watches you carefully, not saying a word.");
	end
end
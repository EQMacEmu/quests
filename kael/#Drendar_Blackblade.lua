function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I do not wish to speak with your kind.  If you have business with the king attend to it now, " .. e.other:Race() .. ".");
	end
end
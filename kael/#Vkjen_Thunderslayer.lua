function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greater ones than you have stood before King Tormax.  Show respect fool.");
	end
end
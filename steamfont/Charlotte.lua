function event_spawn(e)
	e.self:SetRunning(true);
end

function event_signal(e)
	if((e.signal==1) and ((e.self:GetX() == -495) or (e.self:GetX() == -734)) and ((e.self:GetY() == -154) or (e.self:GetY() == 114))) then
		e.self:Emote("Beep.. Beep.. Beep..");
		eq.pause(60);
	end
	if(e.signal==2) then
		eq.start(6);
	end
	if(e.signal==3) then
		eq.start(7);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

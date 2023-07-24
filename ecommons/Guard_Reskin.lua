function event_signal(e)
	if(e.signal == 1 and e.self:GetX() == 159 and e.self:GetY() == 143) then
		e.self:Say("All quiet, Sergeant.");
	end
end

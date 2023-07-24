function event_signal(e)
	if(e.signal == 1 and e.self:GetX() == 3016 and e.self:GetY() == -289) then
		e.self:Say("All quiet, Sergeant.");
	end
end

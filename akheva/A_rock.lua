function event_combat(e)
	if(e.joined) then
		e.self:Emote("falls from the ceiling...");
		eq.spawn2(179015,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end
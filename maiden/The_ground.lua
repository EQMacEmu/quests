function event_combat(e)
	if(e.joined) then
		e.self:Emote("beneath you begins to open up.");
		eq.spawn2(173003,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end

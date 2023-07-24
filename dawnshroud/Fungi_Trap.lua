function event_combat(e)
	if(e.joined) then
		eq.spawn2(174117,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end
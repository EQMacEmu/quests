function event_combat(e)
	if(e.joined) then
		eq.spawn2(123023,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop_with_timer();
	end
end

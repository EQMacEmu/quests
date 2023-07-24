function event_combat(e)
	if(e.joined) then
		eq.spawn2(179016,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.depop_with_timer();
	end
end

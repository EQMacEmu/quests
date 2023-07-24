function event_combat(e)
	eq.spawn2(207304, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- A_shadow
	eq.depop_with_timer();
end

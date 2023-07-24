function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 60, ex + 60, ey - 60, ey + 60, ez - 30, ez + 30);
end

function event_enter(e)
	e.self:Emote("coalesces into a corporeal form.");
	eq.spawn2(181013,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.depop_with_timer();
end

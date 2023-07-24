function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
	e.self:Emote("calesces from the ground!");
	eq.spawn2(169002,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	eq.depop_with_timer();
end

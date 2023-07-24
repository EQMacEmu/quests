function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
	e.self:Emote("cracks open, releasing hungry hatchlings!");
	rand = math.random(100);
	if(rand < 30) then
		eq.spawn2(169001,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	elseif(rand < 60) then
		eq.spawn2(169001,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(169001,0,0,e.self:GetX() + 10,e.self:GetY() + 10,e.self:GetZ(),0);
	else
		eq.spawn2(169001,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(169001,0,0,e.self:GetX() + 10,e.self:GetY() + 10,e.self:GetZ(),0);
		eq.spawn2(169001,0,0,e.self:GetX() - 10,e.self:GetY() - 10,e.self:GetZ(),0);
	end
	eq.depop_with_timer();
end

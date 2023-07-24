-- proximity trigger to spawn Kromrif Death Squad

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 20, e.self:GetX() + 20, e.self:GetY() - 20, e.self:GetY() + 20);
end

function event_enter(e)
	e.self:Emote("been ambushed!");
	eq.spawn2(116014,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ(),0);
	eq.spawn2(116014,0,0,e.self:GetX()-5,e.self:GetY()+5,e.self:GetZ(),0);
	eq.spawn2(116014,0,0,e.self:GetX()+10,e.self:GetY()-5,e.self:GetZ(),0);
	eq.spawn2(116014,0,0,e.self:GetX()-5,e.self:GetY()+10,e.self:GetZ(),0);
	eq.depop_with_timer();
end


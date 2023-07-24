function event_combat(e)
	if(e.joined) then
		e.self:Emote("something crawling up your leg...");
		eq.spawn2(179003,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(179003,0,0,e.self:GetX()+4,e.self:GetY()-11,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(179003,0,0,e.self:GetX()+11,e.self:GetY()-9,e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(179003,0,0,e.self:GetX()-5,e.self:GetY()+13,e.self:GetZ(),e.self:GetHeading());
		if(math.random(1,2) == 2) then
			eq.spawn2(179003,0,0,e.self:GetX()-14,e.self:GetY()+8,e.self:GetZ(),e.self:GetHeading());
		end
		eq.depop_with_timer();
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Emote("feet scratch across the stone floor...");
		eq.spawn2(179346,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		if(math.random(1,2) == 2) then
			eq.spawn2(179346,0,0,e.self:GetX()+8,e.self:GetY()+8,e.self:GetZ(),0);
		end
		eq.depop_with_timer();
	end
end

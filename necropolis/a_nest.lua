local bug = 0;

function event_combat(e)
	if(e.joined) then
		e.self:Emote("erupts, loosing a swarm!");
		bug = math.random(1,3);
		if(bug == 3) then
			eq.spawn2(123024,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()-2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()+2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX(),e.self:GetY()-2,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX(),e.self:GetY()+2,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()+1,e.self:GetY()+1,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		elseif(bug == 2) then
			eq.spawn2(123024,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()-2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()+2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX(),e.self:GetY()-2,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		else
			eq.spawn2(123024,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()-2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
			eq.spawn2(123024,0,0,e.self:GetX()+2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		end
		eq.depop_with_timer();
	end
end

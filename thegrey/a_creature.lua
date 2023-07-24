-- scripts to randomly spawn one of these npc : boulder fiend, a stone beast, a boulderling, stonehead, Boulder

function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 65, ex + 65, ey - 65, ey + 65, ez - 60, ez + 60);
end

function event_enter(e)
	e.self:Emote("of living stone leaps out at you from amongst the rocks!");
	creature = math.random(100);
	if(creature < 30) then
		eq.spawn2(171004,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(171004,0,0,e.self:GetX()+ 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(171004,0,0,e.self:GetX(),e.self:GetY() + 5,e.self:GetZ(),e.self:GetHeading());
	elseif(creature < 60) then
		eq.spawn2(171006,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(171006,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif(creature < 80) then
		eq.spawn2(171007,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	elseif(creature < 90) then
		eq.spawn2(171008,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	else
		eq.spawn2(171009,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	eq.depop_with_timer();
end

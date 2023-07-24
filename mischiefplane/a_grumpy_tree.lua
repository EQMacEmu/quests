local pansy = 0;

function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 65, ex + 65, ey - 65, ey + 65, ez - 10, ez + 20);
end

function event_enter(e)
	e.self:Emote("throws a bunch of pansies at you.");
	pansy = math.random(1,5);
	if(pansy == 5) then
		eq.spawn2(eq.ChooseRandom(126002,126001,126003,126000),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_dandy_pansy (126002), a_pretty_ugly_pansy (126001), a_puny_pansy (126003), an_angry_pansy (126000)
		eq.spawn2(eq.ChooseRandom(126002,126001,126003,126000),0,0,e.self:GetX()-2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_dandy_pansy (126002), a_pretty_ugly_pansy (126001), a_puny_pansy (126003), an_angry_pansy (126000)
		eq.spawn2(eq.ChooseRandom(126002,126001,126003,126000),0,0,e.self:GetX()+2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_dandy_pansy (126002), a_pretty_ugly_pansy (126001), a_puny_pansy (126003), an_angry_pansy (126000)
	elseif(pansy == 3 or pansy == 4) then
		eq.spawn2(eq.ChooseRandom(126002,126001,126003,126000),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_dandy_pansy (126002), a_pretty_ugly_pansy (126001), a_puny_pansy (126003), an_angry_pansy (126000)
		eq.spawn2(eq.ChooseRandom(126002,126001,126003,126000),0,0,e.self:GetX()-2,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_dandy_pansy (126002), a_pretty_ugly_pansy (126001), a_puny_pansy (126003), an_angry_pansy (126000)
	else
		eq.spawn2(eq.ChooseRandom(126002,126001,126003,126000),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_dandy_pansy (126002), a_pretty_ugly_pansy (126001), a_puny_pansy (126003), an_angry_pansy (126000)
	end
	eq.depop_with_timer();
end

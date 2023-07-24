function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45, zloc - 3, zloc + 6);
end

function event_enter(e)
	eq.spawn2(eq.ChooseRandom(112076,112076,112076,112077),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_crystal_shard (112076), a_crystal_shard (112076), a_crystal_shard (112076), a_large_crystal_shard (112077)
	eq.depop_with_timer();
end

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25, zloc - 3, zloc + 6);
end

function event_enter(e)
	e.self:Emote("sees shadows gather themselves into the form of skeletons.");
	eq.spawn2(111116,0,0,358,326,-2.2,0); -- NPC: a_shadowbone
	eq.spawn2(111116,0,0,351,345,-2.2,0); -- NPC: a_shadowbone
	eq.spawn2(111116,0,0,365,344,-2.2,0); -- NPC: a_shadowbone
	eq.depop_with_timer();
end

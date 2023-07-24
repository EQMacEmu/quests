function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25, zloc - 3, zloc + 6);
end

function event_enter(e)
	e.self:Emote("of great treasures and fame spur you on.  Thoughts of certain and painful death do not deter you.");
	eq.depop_with_timer();
end

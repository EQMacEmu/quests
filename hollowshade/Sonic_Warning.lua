function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
	e.other:CastToClient():Message(0,"Eerie high-pitched howls pain your ears. They echo off the hills throughout all of Hollowshade. The sonic wolves have proven victorious and taken control of the moor. All those who tread here should be wary of crossing them.");
end
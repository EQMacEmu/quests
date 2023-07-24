-- As_you_pass NPCID: 124148
function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
	e.other:CastToClient():Message(0,"As you pass the archway a faint glow surrounds your body.");
end
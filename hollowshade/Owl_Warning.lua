function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
	e.other:CastToClient():Message(0,"A shrill screech pierces the air. The sound of drums is conspicuously absent, and an unusual number of feathers float on the wind. Owlbears have seized control of the moor, and those who tread here should be wary.");
end
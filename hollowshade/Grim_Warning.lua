function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
	e.other:CastToClient():Message(0,"The air is thick with magic. Mystic murmuring and incantations emanate from the northwest outpost. The moor now lies in the dubious hands of the Grimlings, and those who tread here should be wary. Their motives are unclear, however the feeling that surrounds you is not one of welcome.");
end
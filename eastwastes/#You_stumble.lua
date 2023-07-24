-- proximity trigger to spawn Tanik Greskil for 4th coldain prayer shawl

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
end

function event_enter(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(116010)) then
		e.self:Emote("in the snow.");
	else
		e.self:Emote("and uncover the body of an injured coldain.");
		eq.unique_spawn(116010,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.depop_with_timer();
	end
end

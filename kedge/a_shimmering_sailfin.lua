function event_death(e)
	if(math.random(100) < 75) then
		e.self:CastSpell(1017, e.other:GetID());                -- fishnova
	end
end

-- Created by Torven

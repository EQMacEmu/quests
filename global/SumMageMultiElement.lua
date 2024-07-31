function event_spawn(e)
	if(not eq.is_the_shadows_of_luclin_enabled()) then
		e.self:SetBaseHP(3000);
		e.self:SetMinDamage(21);
		e.self:SetMaxDamage(67);
	end
end
-- EPIC CLERIC -soldungb-
function event_death_complete(e)
	eq.spawn2(32001,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Zordakalicus_Ragefire
end

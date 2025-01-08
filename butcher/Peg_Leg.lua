function event_death_complete(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		eq.spawn2(68251,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_death_complete(e)
	local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	eq.spawn2(211080, 0, 0, x, y, z, h); -- A_Rabid_Wrulon_Pup 
	eq.spawn2(211080, 0, 0, x, y, z, h); -- A_Rabid_Wrulon_Pup 
end

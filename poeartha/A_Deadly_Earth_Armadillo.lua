function event_death_complete(e)
	local n = math.random(1, 3);
	
	for i = 1, n do
		eq.spawn2(218383, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- A_Miniature_Dustrunner
	end
end

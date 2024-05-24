function event_death_complete(event)
	-- 10% chance to spawn a wurm or two on death
	if ( math.random() < 0.10 ) then
	
		function getRandomWurm()
			local randomWurm = math.random(1, 10);
			
			if ( randomWurm > 5 ) then
				randomWurm = 108506;
				
			elseif ( randomWurm == 1 ) then
				randomWurm = 108520;
				
			elseif ( randomWurm == 2 ) then
				randomWurm = 108521;
				
			elseif ( randomWurm == 3 ) then
				randomWurm = 108522;
				
			elseif ( randomWurm == 4 ) then
				randomWurm = 108523;
				
			elseif ( randomWurm == 5 ) then
				randomWurm = 108524;
			end
			
			return randomWurm;
		end
		
		eq.spawn2(getRandomWurm(), 0, 0, event.self:GetX(), event.self:GetY(), event.self:GetZ(), event.self:GetHeading());
		
		if ( math.random() < 0.5 ) then
			eq.spawn2(getRandomWurm(), 0, 0, event.self:GetX(), event.self:GetY(), event.self:GetZ(), event.self:GetHeading());
		end
	end
end

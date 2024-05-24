function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you, " .. e.other:GetCleanName() .. ". If you are a fellow bard. I must inform you that you will make no profit around here. Not with Guard McCluskey around.");
	elseif(e.message:findi("Guard McCluskey")) then
		e.self:Say("I will tell you no more. I do not wish to end up boxed and buried. Just stay away from Guard McCluskey. He is no honorable man.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 6) then
		e.self:SetRunning(true);
	elseif(e.wp == 4 or e.wp == 7) then
		e.self:SetRunning(false);
	end
end

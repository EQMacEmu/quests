function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you, " .. e.other:GetCleanName() .. ". If you are a fellow bard. I must inform you that you will make no profit around here. Not with Guard McCluskey around.");
	elseif(e.message:findi("Guard McCluskey")) then
		e.self:Say("I will tell you no more. I do not wish to end up boxed and buried. Just stay away from Guard McCluskey. He is no honorable man.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("This cannot be true! I will report this to Commander Kane Bayle himself!");
		eq.signal(12090,2); -- Guard_McCluskey
	end
end

-- END of FILE Zone:qey2hh1  ID:3574 -- Misty_Storyswapper 
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi " .. e.other:GetCleanName() .. ". My mom is sick and I don't know how I can make her feel better. I sure wish I could.");
	end
end

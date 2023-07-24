function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I would be careful around the cubes. Rumor is they've gotten some kind of intelligence now.");
	end
end

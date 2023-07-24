function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am Ranlanos, I am in charge of overseeing our vegetation system here in our great town. If you see anything out of the ordinary make sure you come see me. Good day!");
	end
end

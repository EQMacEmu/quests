function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you " .. e.other:GetCleanName() .. ", don't mind me I've had a lot to drink.");
	end
end

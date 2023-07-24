function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", I have heard of your dedication to the Midst and I must say that it is a pleasure to meet you.");
	end
end

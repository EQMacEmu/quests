function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", and welcome to the Midst Quarter. Please keep in mind that this quarter is one of intense study- although we do not mind visitors with good intentions, there is much work being done.");
	end
end

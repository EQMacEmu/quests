function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:Race() .. ", don't mind the other velium they are mighty suspicious of the new flesh dashing about.");
	end
end

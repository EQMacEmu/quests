function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our shop, " .. e.other:GetCleanName() .. ". Here you will find everything you need to make your own leather armor.");
	end
end

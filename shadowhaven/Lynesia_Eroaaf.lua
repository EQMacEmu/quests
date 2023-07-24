function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". Welcome to our shop.  Please let me know if there is anything you are searching for that we do not carry.");
	end
end

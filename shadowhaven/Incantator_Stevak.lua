function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Midst quarter " .. e.other:GetCleanName() .. ". Should you encounter any shady fellows around here make sure you let someone know.");
	end
end

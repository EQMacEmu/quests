function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the gates of Neriak, " .. e.other:GetCleanName() .. ". Please enter the city but keep a watchful eye for we may still have some Troll guests within. Try not to assault them. For now, you are ok to pass through unharmed.");
	end
end

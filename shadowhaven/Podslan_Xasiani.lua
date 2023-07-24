function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How do you do " .. e.other:GetCleanName() .. ", up for a game of horseshoes? If so check back with me in a bit, I have some errands to run first.");
	end
end

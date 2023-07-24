function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi " .. e.other:GetCleanName() .. ".  You here to join the game?  I'm sure you can join in a little bit.  I need to quit soon, before I lose all my money.");
	end
end

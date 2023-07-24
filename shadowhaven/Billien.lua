function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No one around to dance with, but you look like you can cut a rug there, " .. e.other:GetCleanName() .. ". So how 'bout it?");
	end
end

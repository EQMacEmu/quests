function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there, " .. e.other:GetCleanName() .. ". I sell leather armor of the finest quality but only if you're a big an hefty one like me!");
	end
end

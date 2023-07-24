function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail there, " .. e.other:GetCleanName() .. ". Amberfeld's the name and minin' is my trade. As the council representative of the Snowchippers, it be my duty ta make sure all these politicians and warmongers don't forget one thing. And that's that it's us miners that bring in the ore for weapons and the stones for their fancy houses.");
	end
end

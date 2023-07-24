function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Allo there " .. e.other:GetCleanName() .. ". Take a look at these fantastic contraptions I have for sale!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Allo there " .. e.other:GetCleanName() .. ", welcome to the Black Kettle!  May I offer you one of my homemade stews? And perhaps a fine ale to wash it down?");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ". Enjoying your stay? Great! It's nice to have some new faces around these parts.");
	end
end

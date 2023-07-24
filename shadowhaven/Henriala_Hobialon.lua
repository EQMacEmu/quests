function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ", if you are just arriving in Shadowhaven, then I'm sure you are low on supplies! Make sure you pick some more up here before you go adventuring again.");
	end
end

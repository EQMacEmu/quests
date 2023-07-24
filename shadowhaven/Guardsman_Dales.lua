function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", I am Guardsman Dales of House Fordel. I am personally responsible for the well being of the Trade Commissioner, an important duty as he is such an important person to Shadowhaven.");
	end
end

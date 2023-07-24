function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", I carry spells for those that study the magics of mind alteration.");
	end
end

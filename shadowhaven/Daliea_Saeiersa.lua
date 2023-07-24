function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Shadowhaven, " .. e.other:GetCleanName() .. "! If you're hungry after a long journey, make sure you pick up some of my stew!");
	end
end

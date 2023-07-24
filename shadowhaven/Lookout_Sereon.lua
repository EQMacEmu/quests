function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. "! Now just where do you think you're going! All you could possibly need is right this way in the Short and Stout Quarter! If you are heading that way does that mean you are leaving?");
	end
end

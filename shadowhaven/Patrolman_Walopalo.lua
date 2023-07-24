function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can't ya see I'm on my patrols " .. e.other:GetCleanName() .. "! I can't be caught jawjackin or I will get in big trouble!");
	end
end

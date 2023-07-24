function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". If it is knowledge and wisdom that you seek, then look no further. I hope you enjoy your time while you are with us.");
	end
end

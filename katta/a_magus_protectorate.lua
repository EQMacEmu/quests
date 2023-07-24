function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". Please be careful while visiting the Magus Conlegium you would not want to start any trouble either intentionally nor accidentally.");
	end
end

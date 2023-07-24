function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No thank you " .. e.other:GetCleanName() .. ", I have enough pillows for the time being. If I should need anything throughout my stay I will call for you.");
	end
end

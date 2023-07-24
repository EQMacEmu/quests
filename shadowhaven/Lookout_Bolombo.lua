function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". It is an honor to see you in our fantastic city. The passage behind me leads to the Short and Stout Quarter. I hope you enjoy your stay!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ".  The quarter of the Midst is one of peace and tranquility, stay as long as you like and learn about whatever you desire.");
	end
end

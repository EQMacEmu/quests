function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". It's great to have many new visitors in the Haven. Please have a look at what bars I have to offer.");
		else
			e.self:Say("I am sorry but I am only allowed to make dealings with persons that have found favor in the Midst quarter. Please see Lamukas to inquire about how to further strengthen your alliance with the people of the Midst.");
		end
	end
end

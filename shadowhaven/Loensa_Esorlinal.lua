function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome to the Midst quarter, " .. e.other:GetCleanName() .. ". If you are a spellcaster of the younger ranks, perhaps you will find worth in something that I have for sale.");
		else
			e.self:Say("I am sorry but I am only allowed to make dealings with persons that have found favor in the Midst quarter. Please see Lamukas to inquire about how to further strengthen your alliance with the people of the Midst.");
		end
	end
end

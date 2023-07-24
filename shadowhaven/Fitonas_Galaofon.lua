function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hi there " .. e.other:GetCleanName() .. ", I run a simple shop here in the Midst. My wares consist mostly of items that will aid you in your everyday journeys. Good luck to you.");
		else
			e.self:Say("I am sorry but I am only allowed to make dealings with persons that have found favor in the Midst quarter. Please see Lamukas to inquire about how to further strengthen your alliance with the people of the Midst.");
		end
	end
end

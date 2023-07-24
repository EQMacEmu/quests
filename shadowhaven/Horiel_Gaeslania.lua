function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hi there, " .. e.other:GetCleanName() .. "!  Welcome to my little shop, take your time browsing around and let me know if there is something that you can use.");
		else
			e.self:Say("I am sorry but I am only allowed to make dealings with persons that have found favor in the Midst quarter. Please see Lamukas to inquire about how to further strengthen your alliance with the people of the Midst.");
		end
	end
end

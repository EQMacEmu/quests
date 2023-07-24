function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome to the Midst quarter, " .. e.other:GetCleanName() .. ".  I carry an assortment of gems mostly used by those that trade in the crafting of jewels.  If you should find something that catches your eye, please let me know.");
		else
			e.self:Say("I am sorry but I am only allowed to make dealings with persons that have found favor in the Midst quarter. Please see Lamukas to inquire about how to further strengthen your alliance with the people of the Midst.");
		end
	end
end

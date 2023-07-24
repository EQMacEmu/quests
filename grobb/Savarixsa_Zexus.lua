function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations. " .. e.other:GetCleanName() .. "! I am here as a favor to my brother. High Priest Perrir. We seek loyal followers of Innoruuk to earn their place among the hierarchy of the Spires. Are you [devoted to Innoruuk]?");
	elseif(e.message:findi("devoted to innoruuk")) then
		if(e.other:GetFactionValue(e.self) >= -250) then
			e.self:Say("My brother requests your presence in Neriak at the Spires of Innoruuk. Take this note with you. " .. e.other:GetCleanName() .. ". It will inform Perrir of who sent you.");
			e.other:SummonCursorItem(18148) -- Note of Recommendation
		else
			e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		-- not verified text, using generic DE cleric line
		end
	end
end

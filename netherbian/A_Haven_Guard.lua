function event_combat(e)
	if(e.joined) then
		e.self:Say("Oh, " .. e.other:GetName() .. ", you made a big mistake!");
	end
end

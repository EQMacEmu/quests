function event_combat(e)
	if(e.joined) then
		e.self:Say("My blades have slain dragons! A " .. e.other:Race() .. " like you does not have a chance of survival!");
	end
end

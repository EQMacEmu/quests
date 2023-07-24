function event_combat(e)
	if(e.joined) then
		e.self:Emote("pounces on " .. e.other:GetCleanName() .. " in a flurry of deadly claws and teeth.");
	end
end

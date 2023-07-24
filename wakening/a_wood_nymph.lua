function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("smiles and giggles timidly at " .. e.other:GetCleanName() .. ". I've heard the fauns sing tales of " .. e.other:Race() .. " before.");
	end
end
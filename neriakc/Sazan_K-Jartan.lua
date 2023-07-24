function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances at you from the corner of his eye. 'You'd better speak more swiftly than my blades or you won't walk out of here " .. e.other:GetCleanName() .. ".");
	end
end
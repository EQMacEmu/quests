function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleasure to meet you, " .. e.other:GetCleanName() .. ". Our meeting is about to begin, so please have a seat if you mean to listen in on the latest town happenings.");
	end
end

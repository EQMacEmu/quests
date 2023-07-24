function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("emits a barely audible screech and flutters around " .. e.other:GetCleanName() .. ".");
	end
end

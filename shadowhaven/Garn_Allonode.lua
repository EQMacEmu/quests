function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to meet you, " .. e.other:GetCleanName() .. ".  I carry many supplies that a student of jewel craft would find very handy.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet ya, " .. e.other:GetCleanName() .. "! If you're looking for general supplies, then I've got something you could use. Take a look and thanks for visiting us!");
	end
end

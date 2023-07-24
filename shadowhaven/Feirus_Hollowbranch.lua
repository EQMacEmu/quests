function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleasure to meet you, " .. e.other:GetCleanName() .. ". I carry druid scrolls for the youngest of protectors.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there, " .. e.other:GetCleanName() .. ". If you know a young druid in need of scrolls to further his spell development please send him to see me.");
	end
end

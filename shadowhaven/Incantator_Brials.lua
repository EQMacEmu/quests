function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ". It is nice to meet you however I must continue my patrol, enjoy your study with us.");
	end
end

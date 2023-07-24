function event_signal(e)
	e.self:Say("Thank ye General, it's an honor to be part of such a great brigade.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". Enjoy your stay with us.");
	end
end

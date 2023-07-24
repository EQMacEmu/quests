function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". What brings you here to [Dawnshroud]?");
	elseif(e.message:findi("dawnshroud")) then
		e.self:Say("Dawnshroud is a crazy place. I suggest you travel with a good group here, it can get dangerous.");
	end
end

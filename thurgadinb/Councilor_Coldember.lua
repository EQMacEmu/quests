function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Watch yer step around the Icewell there, " .. e.other:GetCleanName() .. ". I've heard that a giant beast lives down in the pit waiting to devour those who earn the punishment of being dropped down there. Might be just I rumor but I swear I've heard some sounds comin up from the well that don't resemble any of the creatures we put in there.");
	end
end

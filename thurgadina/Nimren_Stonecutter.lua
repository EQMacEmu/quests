function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The finest ore fresh from the mines I have! Take a look, why don't ye, " .. e.other:GetCleanName() .. ". I'm sure I've got somethin' ye be needin'.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I've found it at last! By calculating the aerodynamic plane of the shaft and measuring it against the wind resistance and downward pull of the head I've managed to create the perfect arrow! I suggest ye take advantage of my stock while it lasts, " .. e.other:GetCleanName() .. ". it sure as Brell won't be around for long.");
	end
end

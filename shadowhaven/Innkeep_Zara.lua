function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my inn, " .. e.other:GetCleanName() .. ". You will find our rooms very simple, but comfortable. If you are interested in the double bed, there is no extra charge.");
	end
end

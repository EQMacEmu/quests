function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there, please let me know how I can assist with your transaction today.");
	end
end

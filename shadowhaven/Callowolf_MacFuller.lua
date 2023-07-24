function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, if you are training in the art of alchemy, I have the tools necessary for your trade.");
	end
end

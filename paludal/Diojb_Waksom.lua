function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetins " .. e.other:GetCleanName() .. ". Great day for a mining if I dunt say so meself. Deres alot to be done so if ye need to speak with someone concerning our operation please see Daesorak.");
	end
end

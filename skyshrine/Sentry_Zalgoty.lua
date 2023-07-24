function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Don't mind the velium in next room. They are too caught up in their duty to pay attention to anything else.");
	end
end

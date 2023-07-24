function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:Race() .. ", did you know Lord Yelinak has built a maze to protect the upper levels of the towers from invasion. Keep that in mind when traveling through the shrine.");
	end
end

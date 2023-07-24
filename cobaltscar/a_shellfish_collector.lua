function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Excuse me, strange one, for my rudeness but I must finish collecting the shellfish for tonight's feast in time for them to be properly prepared.");
	end
end
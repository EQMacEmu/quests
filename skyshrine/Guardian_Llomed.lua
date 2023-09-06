function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I would step carefully if you decide to travel further into the shrine.  The Laoch are a very powerful group and do not take kindly to hostile actions towards them.");
	end
end

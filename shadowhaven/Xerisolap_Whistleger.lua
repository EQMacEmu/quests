function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's nice to meet such a well-respected trader in the Haven. I just hope my wife gets better soon, she's been sick for quite sometime now.");
	end
end

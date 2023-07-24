function event_spawn(e)
	eq.set_timer("guys",2400000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What?! I can't talk! I gotta keep staring at the water!");
	elseif(e.message:findi("staring")) then
		e.self:Say("Yup, yup. That's what I do. I am a lookout. Erm, what I mean is, I be a lookout, uhm, matey.");
	elseif(e.message:findi("Lookout")) then
		e.self:Say("Aye. I look for things in the water and let everyone else know if I see something. It's a rough job but as the first mate said, 'Someone's gotta do it, now get up there and don't get down til I tell yas ta get down!' The first mate has been pretty short with me since the accident.");
	end
end

function event_timer(e)
	e.self:Say("Guys, can I get down now please?");
end

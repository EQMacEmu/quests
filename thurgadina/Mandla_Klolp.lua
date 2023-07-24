function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What can I do fer ya? If yer lookin' fer a handout I got nothin for ya. Me darn husband wastes what little money we make on gamblin'. What a sucker! I don't know why I married him.");
	elseif(e.message:findi("him") or e.message:findi("husband")) then
		e.self:Say("Yeah, he's out there somewheres. Oh well, what's a woman to do? I can't sit around and moan all day. I should just learn to have fun with what I have.");
	end
end

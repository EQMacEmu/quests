function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The boss catches me slackin' and I'm dead meat.  I'm already behind on my quota fer the day.");
	end
end

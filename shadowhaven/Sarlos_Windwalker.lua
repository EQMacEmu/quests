function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, my friend. I carry spell scrolls that can be scribed by only the finest pathfinders.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Don't mind the gnome. He's been acting a little strange lately.");
	end
end

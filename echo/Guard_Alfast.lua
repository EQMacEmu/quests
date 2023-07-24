function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("This is where King Grery watches over all the kingdom.  If you ask politely I'm sure he'd grant you an audience.  But don't take up too much of his time, he's a very busy gnome.");
	end
end

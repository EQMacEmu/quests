function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beware, citizen!  This is a dangerous place for the inexperienced.  Only within the walls of Cabilis are you truly safe.  Should you encounter any trouble, run toward the gates.  We troopers can deal with it.");
	end
end
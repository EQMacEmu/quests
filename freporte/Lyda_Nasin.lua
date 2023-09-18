function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am afraid the upstairs bar is closed at night.  Isn't the port of Freeport the grandest place to visit?  I just love watching the ships pull into port.  I wish someone would tell me when the ship is docking.");
	elseif(e.message:findi("ship.* docking")) then
		e.self:Say("Oooh!  I did not hear the ship pull in.  I must go and see it!");
	end
end




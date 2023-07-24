function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Look at all this ore.  I swear we produce more each day and still it's not enough.  The bosses won't be happy 'til they work us all t' death.");
	end
end

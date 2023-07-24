function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahh, yes " .. e.other:GetCleanName() .. ".  I always have time for one of my loyal subjects.  Oh... wait, the Court Sage is signaling me that there is an important matter that needs my immediate attention.  Please come back a little later on and I should have some more time for you."); 
	end
end

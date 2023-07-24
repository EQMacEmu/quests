function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. ". Welcome to the Throne of Karana's Fury!");
	elseif(e.message:findi("throne")) then
		e.self:Say("That is the proper name of our settlement. This clearing was a gift to our ancestors, given to us by Karana! I simply can't believe that a few blasphemous fools actually pushed to change the name to Fort Jaggedpine after all these years. It simply is not right!");
	elseif(e.message:findi("fort")) then
		e.self:Say("Fort Jaggedpine? Bah, this is no military complex! It's just our tiny collection of houses and shops like it has been for generations. I hate the name myself.");
	end
end
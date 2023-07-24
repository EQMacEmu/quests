function event_say(e)
	if(e.message:findi("hail")) then -- no min faction, worked at scowls
		e.self:Say("Greetings! This is no place for a person of your standards. I am but a beggar, which is why I live among the sewer rats. It would be best if you were to leave this dangerous place.");
	elseif(e.message:findi("rat king")) then
		e.self:Say("Rat King? What nonsense do you speak? That is nothing more than a child's faerie tale!");
	end
end
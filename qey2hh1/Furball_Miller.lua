function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("<BARK!>  Hiya!  <Bark!>  <Bark!>  My name is Furball Miller.  I work here on my father's farm.  Of course, he is not my real [father] but he is the one who raised me from a pup.  I hope to go back to [Blackburrow] some day and try to get them to stop all the senseless fighting with the humans of Qeynos.");
	elseif(e.message:findi("from.* blackburrow")) then
		e.self:Say("Blackburrow is home to a clan of gnolls called the Sabertooths.  It is where I am from but I really don't ever remember being there.  Pa tells me the gnolls there are always fighting with the <BARK!>  humans of Qeynos.  I wish they would stop and realize that humans and gnolls are not as different as they like to think.  <BARK!>");
	elseif(e.message:findi("father")) then
		e.self:Say("Cleet and Henina Miller are the only parents I have ever known. They found me hurt in their field and raised me as if I were one of their own children. I love them very much. I don't remember my true parents at all but I know they came [from Blackburrow].");
	elseif(e.message:findi("where.* blackburrow")) then
		e.self:Say("Blackburrow is northwest of here. <Bark!> But I wouldn't go there, " .. e.other:GetCleanName() .. ". They don't like folks like you very much. I wish they were not so <BARK!> stubborn.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Emote("gathers up a bale of straw");
		eq.create_ground_object(13990,-5677,-2363,0,0,600000);
	end
end

-- END of FILE Zone:qey2hh1  ID:1610 -- Furball_Miller 
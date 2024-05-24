function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("Hail")) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", Perhaps you've come to purchase some of my rare supplies? I have a special blend of eleven herbs and spices......oh wait.....I'm sold out of that......anyway. What can I do for you?");
		elseif(e.message:findi("Vagnar") and e.other:GetFaction(e.self) < 6) then
			e.self:Say("Vagnar? I don't recall.....Unless Vagnar was that shaman supposedly on some quest to save our entire race from total destruction..someone always on one of those. He bought some charms to ward of [Dragon kin]. He's most likely in the belly of some beast now.");
		elseif(e.message:findi("Dragon kin") and e.other:GetFaction(e.self) < 6) then
			e.self:Say("Yes he said he needed to steal secrets from the hated Sarnaks to aid him in his true quest. He said the sarnak know ways to cleanse the mind from intrusion, he would say no more.");
		end
	else
		if(e.message:findi("Hail")) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", Perhaps you've come to purchase some of my rare supplies? I have a special blend of eleven herbs and spices......oh wait.....I'm sold out of that......anyway. What can I do for you?");		
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

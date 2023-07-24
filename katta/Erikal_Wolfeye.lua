function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ". I am Erikal Wolfeye, Governor of exploration. Unfortunately, my duties to Katta Castellum tend to keep me from doing much of the actual exploring, but we have many fine men and women out in the field. That reminds me, I will have to check in with [Corporal Donfeld] and see how his new project is going.");
	elseif(e.message:findi("donfeld")) then
		e.self:Say("Corporal Donfeld has a very important job to do for me - reaching out and trying to make new allies is crucial to our future here on Luclin.");
	end
end

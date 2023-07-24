function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you " .. e.other:GetCleanName() .. "! Allow me to introduce myself.  I am Tiplo and I am the best gardener in all of Shadowhaven! If you should need anything from my garden let me know, but whatever you do don't step on my plants!");
	end
end

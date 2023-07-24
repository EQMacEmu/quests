function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo there, " .. e.other:GetCleanName() .. ". I am Erinol, I am da overseer of the mining operations that we run in this here quarter that we call home. I hope you have a nice stay.");
	end
end

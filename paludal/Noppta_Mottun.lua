function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ". I know what youre thinking. What is a halfling doing amongst all these Dwarven miners. Well a strong halfling I am indeed so i fit in just fine!");
	end
end

function event_signal(e)
	e.self:Say("All is going great sir, I will be sure to report any disturbances shall they present themselves.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Do you smell that? Man I sure am hungry and it smells like ol Joe is cooking up some fine steaks. Mmm, I sure hope I can leave soon and get some food.");
	end
end

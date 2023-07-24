function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Pleasant as always Verte. So what can I do for you today?");
	elseif (e.signal == 2) then
		e.self:Say("Ah I see, very well then here is your receipt. Good luck with the cleanup and keep those Dwarves in line!");
	elseif (e.signal == 3) then
		e.self:Say("Ok see you later Verte!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". How can I help you today?");
	end
end

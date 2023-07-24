function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". Although I am not an official Blackhand, I am a longtime family friend. I work here to ensure that the shop runs smoothly. If you should need anything, I'm sure one of us is bound to have it.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

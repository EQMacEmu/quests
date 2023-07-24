function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome to our smithing shop " .. e.other:GetCleanName() .. ", please have a look and let me know if there is a certain mold or tin that you seek. I might have it laying around here somewhere, you never know.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

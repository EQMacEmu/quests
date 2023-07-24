function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("If you're planning on traveling through the Paludal Caverns, make sure you pick up a torch, " .. e.other:GetCleanName() .. ". Those caverns are quite confusing and you don't want to find yourself lost in the dark.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

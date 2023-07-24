function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome, " .. e.other:GetCleanName() .. "! If you need to use anything I have in my shop, such as the mixing bowl here or the loom, please make yourself at home.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

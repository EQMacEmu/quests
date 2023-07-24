function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Ho there, " .. e.other:GetCleanName() .. ". Thinking about picking up a trusty weapon to aid you in the treacherous depths of the Paludal Caverns?  Then you're in luck 'cause I have a few for sale right here!");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

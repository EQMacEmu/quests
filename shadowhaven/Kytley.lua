function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Rockhoppers been giving ya a little too much of a beating out there, " .. e.other:GetCleanName() .. "?  Well, I can understand- after all, not everyone can be as tough as me.  Perhaps this armor will be to your liking. It's not all that much to some, but who wants to be all bogged down in heavy armor while in a battle?");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ", and welcome to our general store. I sell some of the finest weapons that used to be only crafted for the Fordel soldiers, however now you can have one for your very own. For a price, of course.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end

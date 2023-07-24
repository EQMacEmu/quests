function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you " .. e.other:GetCleanName() .. ", I hold spells that you may find useful if you are a warder of nature. If you wish to depart from our tranquil dwelling the key is to go with nature.");
	end
end

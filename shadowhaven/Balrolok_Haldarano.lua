function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey " .. e.other:GetCleanName() .. ", can't ye see I'm entertainin' me lady friend here?  Go grab an ale and a seat... and grab me one too while yer at it! Har Har!");
	end
end

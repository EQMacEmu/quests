function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("Hello there, "..e.other:GetName()..".  If you seek to rest your laurels and stock up on food or water for the upcoming struggles ahead, I can provide you with any basic supplies you may need.");
	end
end

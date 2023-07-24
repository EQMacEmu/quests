function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Hello there.  Forgive me for staring, but it seems more and more of your kind have been passing through here each day.  You sure are a curious "..e.other:Race()..".");
	end
end

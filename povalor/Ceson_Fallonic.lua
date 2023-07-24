function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("Hello, "..e.other:GetName()..". I don't think you should bother the men in the next room. They are extremely busy looking over the tactical maps of this region.");
	end
end

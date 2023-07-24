function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("sizes you up, 'Well met. I hope you are prepared for what you may face outside of this hall, the safety ends outside these walls.'");
	end
end

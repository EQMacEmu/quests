function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Hail, "..e.other:GetName()..". You can just call me Banum. Just [exploring] are you?");
	elseif ( e.message:findi("exploring") ) then
		e.self:Say("Be careful out there, I have heard of the glass playing tricks on people's eyes.");
	end
end

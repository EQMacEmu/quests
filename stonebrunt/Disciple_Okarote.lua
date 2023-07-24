function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Emote("stares into empty space, seemingly in meditation. Around his neck is a heavy, iron beaded necklace. He holds the necklace in one hand and passes each bead through his fingers as he chants softly, a whisper for each bead. After a moment, his eyes come into focus and he says, 'How may I help you?");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	end
end

function event_death_complete(e)
	eq.unique_spawn(100018, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- Ghost_of_Ridossan
end

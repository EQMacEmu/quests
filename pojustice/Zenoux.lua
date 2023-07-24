function event_say(e)
	if(e.language == 22 and e.other:GetLanguageSkill(22) == 100) then -- Elder Dragon
		if(e.message:findi("hail")) then
			e.self:Say("Mortal. . .' He flaps his wings and a talon taps against the floor, making a sharp noise in the silence. 'Mortal. . . time is short. If you can understand me, perhaps you can help me. I need my grimoire, my tome, the source of my power. With help from the [distant ones], I can make my escape.",22);
		elseif(e.message:findi("distant one")) then
			e.self:Say("My learning is one of the eldest. . . perhaps. . . in all existence. From the depths of Limbo can I convene with them. . . they, the distant ones. My bidding can they fulfill, for short times. I need my grimoire! My grimoire, hear me, " .. e.other:Race() .. "! Fetch it and I can reward you with riches beyond your wildest reckoning! Hurry!",22);
		end
	else
		e.self:Emote("does not appear to understand you.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up at you through wild eyes, 'You help me, I tell you things! I no lie! You not kill me. I beg. Things I know, you will see.' ");
	elseif(e.message:findi("things")) then
		e.self:Say("Big catman in jail we have. I got key. I give you key and you not kill me. I beg!");
	elseif(e.message:findi("key")) then
		e.self:Say("Take, take, I trust. You no kill me now. Hurry, locks change soon!");
		e.other:SummonCursorItem(5976); -- Forked Prison Key
	end
end

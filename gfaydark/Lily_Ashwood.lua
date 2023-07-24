function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". You wouldn't by chance happen to be a ranger, would you?'");
	elseif(e.message:findi("ranger")) then
		e.self:Say("I sure love a strong ranger. Especially Ganelorn Oast. He's so dreamy and handsome. I think one day he's going to ask me to marry him.");
		eq.signal(54085,1); -- NPC: Devin_Ashwood
	elseif(e.message:findi("take him the letter")) then
		if(e.other:GetLevel() >= 50) then
			e.self:Emote("smiles sweetly. 'Thank you sooo much.' ");
			e.other:SummonCursorItem(20876); -- Item: A love letter (Sealed)
		else
			e.self:Say(eq.ChooseRandom("Someone with your skills is more suited to beetle slaying.  Run along, now.","This matter is far too advanced for you to handle.  Come back after you've killed a few more large rats.","It's much safer for you to spend time fishing than on a dangerous issue like this.","I think I saw a gnoll pup you could probably defeat, a few miles back."));
		end
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("sulks");
	elseif(e.signal == 2) then
		e.self:Emote("laughs. 'In your dreams, little brother.' ");
	elseif(e.signal == 3) then
		e.self:Say("Oh! If you're going to see him, would you please take this letter to him? I trust you, since you're a ranger and all");
	end
end

-- END of FILE Zone:gfaydark  ID:54082 -- Lily_Ashwood 
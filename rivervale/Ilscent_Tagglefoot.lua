function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh hello, " .. e.other:GetCleanName() .. ".  My name is Ilscent.   I am glad to see you, but I am in a bit of a [bind] right now.");
	elseif(e.message:findi("bind")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Well, I promised an ally of ours that I would send him a case of Jumjum juice for all the help he has given us.  I had planned on taking it to him myself but I have too many chores to do here on the farm. Will you take the [jumjum juice] to him?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("jumjum juice")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Oh, thank you so much!  His name is Xanuusus and he lives in the Plains of Karana, in the foothills along their northern edge, actually.  We are most grateful for your help.  Xanuusus normally rewards messengers well.");
			e.other:SummonCursorItem(13411); -- Item: Case of Jumjum Juice
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

-- END of FILE Zone:rivervale  ID:19102 -- Ilscent_Tagglefoot 


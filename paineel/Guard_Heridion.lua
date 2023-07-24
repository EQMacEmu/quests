function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 100) then
		if(e.message:findi("hail")) then
			e.self:Say("Uggg. You needz [keyz]? Rrrrrrr.");
		elseif(e.message:findi("key")) then
			e.self:Say("Uggggg. Take dis keyz.");
			e.other:SummonCursorItem(6378); -- Item: Bone Crafted Key
		end
	elseif(e.other:GetFactionValue(e.self) >= -0) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")	
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

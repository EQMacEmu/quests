function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Greetings! I am Delharn. from [Freeport]. I'm trying to earn some extra coin while passing through Highpass. I figure this is a pretty honorable way to do so.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("freeport")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Freeport? It's the biggest city in all of Antonica! Whatever you're looking for, save for peace and quiet, you'll find it in Freeport.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("orc")) then
		if(e.other:GetFactionValue(e.self) >= -350) then	
			e.self:Say("These pesky orcs are a bit tougher than the ones I used to hunt in [Freeport]. Smell worse, too.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("keep") or e.message:findi("qeynos") or e.message:findi("karana")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Sorry, I've only been around here a little more than a week. Try asking Captain Ashlan there - I bet he'll know.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

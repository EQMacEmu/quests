function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  May the glory of Solusek Ro burn in your veins.  I am the forge master of this temple.  Called to service by the Burning Prince.  Should you ever need my service and find me gone. have no fear. I shall return.  I must occasionally venture to other realms in service of the temple.  I shall always return. this is my eternal home.");
	elseif(e.message:findi("ronium")) then
		e.self:Say("You seek ronium.  It is a fine blend of metals.  I alone hold the secret of its formula.  I, and I alone, can offer it to those who serve this temple.  Do you wish a [bar of the alloy]?");
	elseif(e.message:findi("armor.* ro")) then
		e.self:Say("So you wish to know more of the Armor of Ro?  We have kept it's secret for a long time.  It can only be worn by paladins of high esteem.  They must be crafted by the one who wears it.  Ro wishes his mighty paladins to also be adept in blacksmithing.  They may take to the forge, a mold of the Ro Armor and a bar of the alloy [Ronium].  Then you may forge the armor of Ro.");
	elseif(e.message:findi("bar of the alloy")) then
		if(e.other:GetFactionValue(e.self) >= 100) then   -- must be amiable or better
			e.self:Say("Take this Sol Cauldron.  Within it shall be combined elements of this world.  You will add to it, melatite, two bars of enchanted platinum, Mistmoore granite, the sands of Ro and soil of Underfoot.  If you be a master blacksmith, the elements shall combine to make the enchanted metal I have named 'ronium.'");
			e.other:SummonCursorItem(17977); -- Sol Cauldron -- 6-slot container
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("There is much service to Ro which you must perform.  I cannot trust you until you have proven your worth to us.  Seek service within this temple or join the crusade within the desert of Ro.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	end
end

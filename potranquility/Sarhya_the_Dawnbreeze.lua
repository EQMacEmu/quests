function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if ( e.message:findi("hail") ) then
		if ( qglobals.zebuxoruk and qglobals.zebuxoruk == "2" ) then
			e.self:Say("It appears that you are ready to travel into the Elemental Planes.  Beware many of the gods there have set up wards to protect them against assaults.  Most I cannot speak about; however I do have information on the Circle of Protection that guards Xegony, in her [Plane of Air].");
		else
			e.self:Say("Well met.  I am keeper of the Portal to the [Plane of Air].");
		end
		
	elseif ( e.message:findi("plane of air") ) then
		if ( qglobals.zebuxoruk and qglobals.zebuxoruk == "2" ) then
			e.self:Say("Xegony has created four avatars, each one embodies a different aspect of her power, and each of these avatars was created with a portion of her very essence. The story goes, the one who possesses each of these essences may create a key to break Xegony's ward and enter into her inner sanctum. I don't know the truth behind this, as I have neither the power, nor the desire to challenge the Avatars myself. I have fashioned this, which I believe will form the four essences into a key.");
			if ( not e.other:HasItem(17888) ) then
				e.other:SummonCursorItem(17888); -- Pouch of Swirling Winds
			end
		else
			e.self:Say("The Elemental Planes are not for idle exploration. Return to me when you have a reason to enter and I will consider opening the portal for you.");
		end
	end
end

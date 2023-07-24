------------------------------------------------------------------------------------------------------------------
-- Phiz Frugrin (ID:56177)
-- Zone:   Steamfont (steamfont)
-- Quest:  Telescope Lenses
-- Author: a_sewer_rat
------------------------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello my friend. Good to meet you.");
	elseif(e.message:findi("lens")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("Oh my. I have bad news. It was stolen by a dark elf rogue. She fled very quickly. My little legs could not keep up. Here. She dropped this. You must find her. Get it back. We have very few Lenses.");
			e.other:SummonCursorItem(18867); -- filthy towel
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		else
			e.self:Say("You dare to speak to a member of the Eldritch Collective! You had best leave before you find your soul displaced from your body.");
		end	
	end
end

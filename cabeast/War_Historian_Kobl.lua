function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You have come to learn. have you not?  I have knowledge of importance to young warriors of the legion.  Or perhaps you are a scribe seeking my [unique writing materials]!");
	elseif(e.message:findi("materials")) then
		e.self:Say("You must be a scribe of sorts?  Always glad to assist a talented youth.  I make two things unique to Cabilis and important to any future master scribe.  I can create [blood ink] and [illweed parchment].");
	elseif(e.message:findi("ink")) then
		e.self:Say("If blood ink is what you seek. then only I can provide it.  I use a unique blend prepared by my secret method.  I can supply you with a vial of blood ink. but first you must fetch me four ingredients.  I need globules of blood from certain creatures.  I need globules from the carnivorous plants. leeches and mosquitoes.  I also need globules from the blood pit of the Tower of Death.  Bring me these and be quick. or the blood will disintegrate.");
	elseif(e.message:findi("parchment")) then
		e.self:Say("If you wish to obtain a page of my illweed parchment. you only have to perform a simple task.  Bring me four illweed reeds from the Lake of Ill Omen.  You may find that the only way one can find illweed is to go fishing.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

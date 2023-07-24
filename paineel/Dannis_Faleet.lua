function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Fortune's Fancy. " .. e.other:GetCleanName() .. "!  I carry only the finest jewels and jewelry in all the land.  All of the [charges and accusations] made against me are obviously false. as you can see by my beautiful wares.");
	elseif(e.message:findi("charges")) then
		e.self:Say("Bah!  Some of the, ehem, fine residents of this city have accused me of replacing precious gems with glass.  They have even gone so far as to say that I shortchange people.  The nerve!  It is good that so many [people] require my services.");
	elseif(e.message:findi("people")) then
		e.self:Say("Well, you see, as I am the only jeweler in this fine city, I am required to render service to the palace, all the guild houses and all of the fine citizens here.  Between you and me, I think that's the only reason I am still around.");
	end
end

--END of FILE Zone:paineel  ID:75078 -- Dannis_Faleet
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
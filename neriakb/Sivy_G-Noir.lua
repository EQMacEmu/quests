function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you wish to view my wares or have you simply come to gawk in awe?");
	elseif(e.message:findi("wares")) then
		e.self:Say("The various molds that I have for sale are used in the smithing of weapons. Simply use the necessary molds with a sheet of metal, a forge, and a water flask. Weapons with hilts and pommels will also need molds for those pieces and weapons such as pole-arms and axes require an oak shaft.");
	end
end

--END of FILE Zone:neriakb  ID:41086 -- Sivy_G`Noir
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
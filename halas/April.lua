function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetCleanName() .. ". I'm a maker of weapon molds. Care to view my wares?");
		e.self:DoAnim(29);
	elseif(e.message:findi("wares")) then
		e.self:Say("The various molds that I have for sale are used in the smithing of weapons. Simply use the necessary molds with a sheet of metal, a forge, and a water flask. Weapons with hilts and pommels will also need molds for those pieces and weapons such as pole-arms and axes require an oak shaft.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

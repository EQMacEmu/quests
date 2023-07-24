function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I have much work to do for the Legion of Cabilis! Have you come to view my wares, or to learn the art of weapon smithing so that you may assist me in crafting weapons for our warriors?");
	elseif(e.message:findi("wares")) then
		e.self:Say("The various molds that I have for sale are used in the smithing of weapons. Simply use the necessary molds with a sheet of metal, a forge, and a water flask. Weapons with hilts and pommels will also need molds for those pieces and weapons such as pole-arms and axes require an oak shaft.");
	elseif(e.message:findi("assist")) then
		e.self:Emote("eyes you doubtfully and says 'Any help is better than no help. Basic Shan'Toks, Fer'Esh, and Sheer Blades can be crafted with an appropriate Blade Mold, a Hilt and Pommel Mold, a Folded Sheet of Metal, and a Flask of Blood Water. Once you have mastered basic weapon craft perhaps you can attempt [skyiron weapons] and [imbued weapons].");
	end
end

-- Broken Dialogue for "skyiron weapons" and "imbued weapons", just gives the "weapons/wares" response on live. -- elroz

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

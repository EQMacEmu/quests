function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  You have come to the Anthenaeum Necromanita.  This place serves as the stores of knowledge for the Seekers of the [Dark Truth].");
	elseif(e.message:findi("dark truth")) then
		e.self:Say("The Dark Truth is what all the [necromancers] in Paineel seek to learn.  The [real truth] is far more interesting.");
	elseif(e.message:findi("necromancers")) then
		e.self:Say("The necromancers here are called the Seekers of the Dark Truth.  The leader of the Seekers is known as the Speaker of the Dark Truth.  The current Speaker is Coriante Verisue.  She does, however, have many [rivals].");
	elseif(e.message:findi("rivals")) then
		e.self:Say("I support Coriante due to my respect for her.  Many have no such respect and covet her power and position.  One such individual is Darton, the Seeker's Chief Researcher.  He is a direct descendant of [Dartain], a hero to our people.");
	elseif(e.message:findi("dartain")) then
		e.self:Say("That is a long story indeed, " .. e.other:GetCleanName() .. ".  Many years ago, the heretics and the people of Erudin had a grand battle.  During the conflicts, great magics were performed and many catastrophic effects plagued these lands, a good example of which would be the Hole.");
	elseif(e.message:findi("real truth")) then
		e.self:Say("The real truth is actually a theory of mine which I believe to be true.  You see, the Seekers believe that necromancy is all that can be gained from the Dark Truth, whereas I believe it is merely a by-product.");
	elseif(e.message:findi("hole")) then
		e.self:Say("The Hole is a mysterious creation indeed.  It was also a remarkable find.  Within the vast caverns created by the magical battles, we found something very interesting.  The Seekers call it the [Vault].  Much was done to research the Vault, but that is a story in and of itself.");
	elseif(e.message:findi("vault")) then
		e.self:Say("From what I can discern, the Vault was created from living stone.  It was an artifact created by Brell Serilis to seal the passageway he had opened between the Plane of Underfoot and Norrath.  The Vault was to keep Norrath safe from some of the more vicious denizens of the Plane of Underfoot.  Something went terribly [wrong].");
	elseif(e.message:findi("wrong")) then
		e.self:Say("During the Seekers' investigation of the Vault, they weakened its properties.  In doing so, it released hordes of earthen elementals into our fine city.  Had Dartain not [sacrificed] himself, we would surely be an extinct race.");
	elseif(e.message:findi("sacrificed")) then
		e.self:Say("When the Seekers developed a patch for the Vault, they sent Dartain in to magicially reseal the gateway.  He was set upon by denizens of the Plane of Underfoot, and escaped into the Vault.  There, with full knowledge that he would be trapped, he magically sealed the Vault once again, allowing us the freedom to create the [new city] you stand in now.");
	elseif(e.message:findi("new city")) then
		e.self:Say("You know not of what I speak?  You should have really paid more attention to your studies.  The city in which you now live is New Paineel.  The ruins of the [old city] are the blight we call the Hole.");
	elseif(e.message:findi("old city")) then
		e.self:Say("The old city was marvelous indeed.  The one that we have rebuilt barely captures the majesty the old city once displayed.  It is still quite remarkable even in its destruction, however, it is heavily guarded by the [minions] of the Underfoot.");
	elseif(e.message:findi("minion")) then
		e.self:Say("The creatures who now call the city home are led by the Earthen Lord Yael.  He is a force to be reckoned with, as he commands only the strongest of the elemental legions.  Tread softly if you see him, for he will not hesitate to take your life.  I grow tired, child.  Please, enough stories for today.  I must rest.");
	end
end

--END of FILE Zone:paineel  ID:75077 -- Talloth_Vara
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
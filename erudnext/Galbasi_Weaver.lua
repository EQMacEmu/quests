function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("%s, well met!  Perhaps you would care to peruse my wares.'  Galbasi smiles gently and shows you a number of cloth pieces.  'Or maybe you would care to learn of my hand-made [Woven Platinum] or [Steelweave] armors?", e.other:GetCleanName()));
	elseif(e.message:findi("woven platinum")) then
		e.self:Say("Woven platinum is a hard-wearing, yet flexible, compound which I use to make protective clothing for the city's learned scholars.  It allows magic to be focused fully, unlike other harder-wearing armors.'  Galbasi peers intently at your clothing.  'Perhaps you'd care to know the [method] of its creation?");
	elseif(e.message:findi("method")) then
		e.self:Say("I was curious at your age too.'  Galbasi smiles warmly.  'I use enchanted platinum thread as the basic weave, made by smithing platinum thread with a large enchanted brick of high quality ore, gently using a smithing hammer.  With this thread, in an Erudite Sewing Kit, use your embroidering needle, silver thread, a pattern, an imbued gem and some [infused silk].");
	elseif(e.message:findi("infused silk")) then
		e.self:Say("The Terrorantula Silk is the most appropriate for a construction of this kind, and actually aids in the focus of magic for the silk's wearer.  Simply place a swatch of this silk into your sewing kit, with a small measure of [celestial temper].");
	elseif(e.message:findi("celestial temper")) then
		e.self:Say("This is an unusual compound.  A stranger was attempting to sell me some recently, just before he was removed from the city for... certain offences.'  Galbasi's eyes become firm.  'It seems to be the dust from a blue diamond, dissolved in water - though water more pure than I have encountered.  I can only speculate.");
	elseif(e.message:findi("steelweave")) then
		e.self:Say("Steelweave!  The armor of those in the midst of battle!  With two lengths of [special thread], your embroidering needle, a pattern, an imbued gem, and a few [infused silk] swatches, your Erudite sewing kit can produce a rigid weave the likes of which you have never seen!");
	elseif(e.message:findi("special thread")) then
		e.self:Say("Take a large brick of enchanted high quality ore, some gold thread, and gently use your smithing hammer upon it.  All of my work is performed in the special Erudin Forge, its unique temperature is required for my purposes.");
	end
end

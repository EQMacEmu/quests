function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. "!  These are exciting times indeed!  Tanalin and myself have been working on some new [mithril armor], using a few new techniques introduced to us by... A friend.'  Bedida looks hesitant, then smiles again.  'Very exciting indeed!'");
	elseif(e.message:findi("mithril armor")) then
		e.self:Say("Mithril is the ore used here in Felwithe for centuries, as well you may know.  We've been working on a set of [chainmail] and a set of [platemail].  Either can be worked with a blessed emerald to imbue it with the Elfmother's touch.  Tanalin works them in the Felwithe Forge.");
	elseif(e.message:findi("chainmail")) then
		e.self:Say("Much like Talalin's traditional chain armor, this is so light that it can be worn by our spellweavers, the Keepers of the Art!  Using moonlight temper, silk, an elven hammer, the relevant chainmail pattern, and some [infused rings], the armor is made.");
	elseif(e.message:findi("rings")) then
		e.self:Say("Taking a few velium rings, work in an enchanted large brick of mithril, using your elven hammer and some [magical temper].");
	elseif(e.message:findi("platemail")) then
		e.self:Say("From enchanted mithril chain jointing, moonlight temper, a plate mold, your elven hammer, leather padding, and sheets of infused mithril is it made.  From a folded sheet of velium, with elven hammer and an enchanted large brick of mithril come these latter components, though you will also need some [magical temper].");
	elseif(e.message:findi("temper")) then
		e.self:Say("Now, this magical temper is strange stuff, we acquired a limited quantity from our... friend.  I don't know from where it comes, or from it is made, but I do know that it allows us to make amazingly light, yet strong armor!");
	end
end



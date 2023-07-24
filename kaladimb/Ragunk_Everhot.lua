function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ye Gods, that's the stuff!'  Ragunk burps loudly as he takes a swig from a small flask on his forge.  'Fit for the King himself!  Maybe I can get this [armor] finished on time!");
	elseif(e.message:findi("armor")) then
		e.self:Say("Don't interrupt me, child.  I'm drinking.'  Ragunk staggers and takes another swig from his flask.  'Say, do you know anything about [chainmail] or [platemail]?");
	elseif(e.message:findi("chainmail")) then
		e.self:Say("Hah!  I thought not.  I've recently come into contact with a very interesting person.  Very interesting indeed.'  Rungak burps again.  'Not that I ever saw his face mind, that bloody dark robe is enormous!  He did have some good ideas about [brellium] though.");
	elseif(e.message:findi("platemail")) then
		e.self:Say("Heavy duty stuff, very serious it is.  With enchanted brellium chain jointing, my dwarven hammer, earthen temper, a small plate mold and a few [infused sheets] of brellium, the sky is the limit!  It looks as if it'd take imbuing, too.");
	elseif(e.message:findi("brellium")) then
		e.self:Say("Well, he showed me how to work it into stronger rings than before.  Taking a few velium rings, and then working in a large brick of enchanted brellium, with my dwarven  smithy hammer, and a little [strange temper].  Then I used that to make the chainmail.  Such a simple [method]!");
	elseif(e.message:findi("infused sheet")) then
		e.self:Say("An enchanted large brick of brellium can be worked into a folded velium sheet with a dwarven smithy hammer.  Don't forget that [strange temper], too - that's the secret to all this!");
	elseif(e.message:findi("strange temper")) then
		e.self:Say("My new friend gave me enough to make several sets of armor, it really is quite something.'  Ragunk takes a mouthful of pungent drink from his flask, you think that his eyes look a little nervous.  'I'm not sure what's in it, but my old Dwarven eyes detected a fine, blue powder within.  Who knows!");
	elseif(e.message:findi("method")) then
		e.self:Say("You're all questions, aren't you!  Take your dwarven hammer, and a small piece of leather armor, earthen temper, a small sectional mold and then some of the infused brellium rings, and you've a handy set of linked chain!  I may try imbuing later, maybe peridot or ruby would work.  All in the dwarf forge, of course!");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
